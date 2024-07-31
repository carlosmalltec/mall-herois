import 'package:dartz/dartz.dart';
import 'package:malltec_heroes/services/rest_client/check_state_network/check_network.dart';
import 'package:malltec_heroes/services/rest_client/failures.dart';

import '../../storage/helpers/cache_save_category/save_category_cache.dart';
import '../../storage/helpers/category/category_base_dao.dart';
import '../../storage/helpers/category/category_model_storage.dart';
import '../../type_failures/errors.dart';
import '../../type_failures/format_exception_decode.dart';
import '../../type_failures/not_found_result.dart';
import '../../type_failures/rest_client_exception_error.dart';
import '../../type_failures/unknown_error.dart';
import '../data/models/category_model.dart';
import '../data/repositories/category_repository.dart';

class CategoryStore {
  final CategoryRepository repository;
  final CheckInternet checkInternet;
  final CategoryBaseDAO categoryBaseDAO;
  final SaveCategoryToCache cacheCategorys;

  CategoryStore({
    required this.repository,
    required this.checkInternet,
    required this.categoryBaseDAO,
    required this.cacheCategorys,
  });

  Future<Either<Failures, List<CategoryModel>?>> findAllCategoryServer() async {
    final result = await repository.findAllCategory();
    late Errors results;
    return result.fold(
      (l) {
        if (l is NotFoundResult) {
          results = Errors(message: 'não encontramos resultados');
        } else if (l is FormatExceptionDecode || l is UnknownError) {
          results = Errors(
              message: 'Encontramos um problema interno, notifique o suporte!');
        } else if (l is RestClientExceptionError) {
          results = Errors(message: (l).message.toString());
        }
        return Left(results);
      },
      (r) => Right(r),
    );
  }

  Future<List<CategoryModel>> getCategoryStorage() async {
    try {
      List<CategoryModel> prepareList = [];
      final List<CategoryModelStorage> result = await categoryBaseDAO.findAll();
      if (result.isEmpty) {
        return [];
      }
      for (var i = 0; i < result.length; i++) {
        prepareList.add(
          CategoryModel(
            id: result[i].id!,
            name: result[i].name!,
          ),
        );
      }
      return prepareList;
    } catch (e) {
      return [];
    }
  }

  Future<bool> saveCategoryStorage(List<CategoryModel> data) async {
    try {
      List<CategoryModelStorage> prepareList = [];

      for (var i = 0; i < data.length; i++) {
        prepareList.add(
          CategoryModelStorage(
            id: data[i].id,
            name: data[i].name,
          ),
        );
      }
      await cacheCategorys.saveCategoryTimeCache(prepareList);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Either<Failures, List<CategoryModel>?>> getCategorys() async {
    bool isConnection = await checkInternet.isConnection();
    if (isConnection) {
      final result = await findAllCategoryServer();
      return result.fold(
        (l) => Left(l),
        (response) {
          if (response != null) {
            saveCategoryStorage(response);
          }
          return Right(response);
        },
      );
    }

    final List<CategoryModel> storageList = await getCategoryStorage();
    if (storageList.isNotEmpty) {
      return Right(storageList);
    } else {
      return Left(NotFoundResult(message: 'nenhum resultado encontrado'));
    }
  }
}
