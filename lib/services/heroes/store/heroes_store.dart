import 'package:dartz/dartz.dart';

import '../../categorys/data/models/category_model.dart';
import '../../rest_client/check_state_network/check_network.dart';
import '../../rest_client/failures.dart';
import '../../storage/helpers/cache_save_heroes/save_heroes_cache.dart';
import '../../storage/helpers/heroes/heroes_base_dao.dart';
import '../../storage/helpers/heroes/heroes_model_storage.dart';
import '../../storage/helpers/request_storage/request_base_dao.dart';
import '../../storage/helpers/request_storage/request_model_storage.dart';
import '../../type_failures/errors.dart';
import '../../type_failures/format_exception_decode.dart';
import '../../type_failures/not_found_result.dart';
import '../../type_failures/rest_client_exception_error.dart';
import '../../type_failures/unknown_error.dart';
import '../data/models/heroes_model.dart';
import '../data/models/request_model.dart';
import '../data/repositories/heroes_repository.dart';

class HeroesStore {
  final HeroesRepository repository;
  final CheckInternet checkInternet;
  final HeroesBaseDAO heroesBaseDAO;
  final SaveHeroesToCache cacheHeroes;
  final RequestBaseDao requestBaseDao;

  HeroesStore({
    required this.repository,
    required this.checkInternet,
    required this.heroesBaseDAO,
    required this.cacheHeroes,
    required this.requestBaseDao,
  });

  Future<void> checkRequestStorage() async {
    try {
      List<RequestModelStorage> results = await requestBaseDao.findAll();
      if (results.isNotEmpty) {
        for (var i = 0; i < results.length; i++) {
          final data = results[i];
          switch (data.typeRequest) {
            case "POST":
              final requestData = RequestModel(
                active: data.active == 1 ? true : false,
                categoryId: data.categoryId,
                name: data.name,
              );
              final result = await registerHeroes(requestData);
              if (result.isRight()) {
                await requestBaseDao.deleteRequest(data.created!);
              }
              break;
            case "PUT":
              final requestData = RequestModel(
                active: data.active == 1 ? true : false,
                categoryId: data.categoryId,
                name: data.name,
                id: data.id,
              );
              final result = await updateHeroes(requestData);
              if (result.isRight()) {
                await requestBaseDao.deleteRequest(data.created!);
              }
              break;
            case "DELETE":
              final requestData = RequestModel(
                active: data.active == 1 ? true : false,
                categoryId: data.categoryId,
                name: data.name,
                id: data.id,
              );
              final result = await deleteHeroes(requestData);
              if (result.isRight()) {
                await requestBaseDao.deleteRequest(data.created!);
              }
              break;
            default:
          }
        }
      }
    } catch (e) {}
  }

  Future<Either<Failures, List<HeroesModel>?>> findAllHeroesServer() async {
    final result = await repository.findAllHeroes();
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

  Future<List<HeroesModel>> getHeroesStorage() async {
    try {
      List<HeroesModel> prepareList = [];
      final List<HeroesModelStorage> result = await heroesBaseDAO.findAll();
      if (result.isEmpty) {
        return [];
      }
      for (var i = 0; i < result.length; i++) {
        prepareList.add(
          HeroesModel(
            id: result[i].id!,
            name: result[i].name!,
            active: result[i].active == 1,
            category: result[i].category != null
                ? CategoryModel.fromMap(result[i].category!.toMap())
                : CategoryModel.empty(),
          ),
        );
      }
      return prepareList;
    } catch (e) {
      return [];
    }
  }

  Future<bool> saveHeroesStorage(List<HeroesModel> data) async {
    try {
      List<HeroesModelStorage> prepareList = [];

      for (var i = 0; i < data.length; i++) {
        prepareList.add(
          HeroesModelStorage(
            id: data[i].id,
            name: data[i].name,
          ),
        );
      }
      await cacheHeroes.saveHeroesTimeCache(prepareList);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Either<Failures, List<HeroesModel>?>> getHeroes() async {
    bool isConnection = await checkInternet.isConnection();
    if (isConnection) {
      final result = await findAllHeroesServer();
      return result.fold(
        (l) => Left(l),
        (response) {
          if (response != null) {
            saveHeroesStorage(response);
          }
          return Right(response);
        },
      );
    }

    final List<HeroesModel> storageList = await getHeroesStorage();
    if (storageList.isNotEmpty) {
      return Right(storageList);
    } else {
      return Left(NotFoundResult(message: 'nenhum resultado encontrado'));
    }
  }

  Future<Either<Failures, bool>> registerHeroes(RequestModel parameters) async {
    bool isConnection = await checkInternet.isConnection();
    late Errors results;
    if (isConnection) {
      final result = await repository.registerHeroes(parameters);
      return result.fold(
        (l) {
          if (l is UnknownError) {
            results = Errors(message: (l).message.toString());
          } else if (l is RestClientExceptionError) {
            results = Errors(message: (l).message.toString());
          }
          return Left(results);
        },
        (r) => Right(r),
      );
    } else {
      final params = RequestModelStorage(
        name: parameters.name,
        active: parameters.active == true ? 1 : 0,
        categoryId: parameters.categoryId,
        created: DateTime.now().microsecondsSinceEpoch,
        typeRequest: "POST",
      );
      int? response = await requestBaseDao.save(params);
      return response > 0
          ? const Right(true)
          : Left(
              Errors(
                message:
                    'Não foi possível guardar a requisição, terá que efetuar um novo cadastrado',
              ),
            );
    }
  }

  Future<Either<Failures, bool>> updateHeroes(RequestModel parameters) async {
    if (parameters.id == null || parameters.id == 0) {
      return Left(
        Errors(message: 'Para atualizar se faz necessário informar o ID'),
      );
    }

    bool isConnection = await checkInternet.isConnection();
    late Errors results;
    if (isConnection) {
      final result = await repository.updateHeroes(parameters);
      return result.fold(
        (l) {
          if (l is UnknownError) {
            results = Errors(message: (l).message.toString());
          } else if (l is RestClientExceptionError) {
            results = Errors(message: (l).message.toString());
          }
          return Left(results);
        },
        (r) => Right(r),
      );
    } else {
      final params = RequestModelStorage(
        id: parameters.id,
        name: parameters.name,
        active: parameters.active == true ? 1 : 0,
        categoryId: parameters.categoryId,
        created: DateTime.now().microsecondsSinceEpoch,
        typeRequest: "PUT",
      );
      int? response = await requestBaseDao.save(params);
      return response > 0
          ? const Right(true)
          : Left(
              Errors(
                message:
                    'Não foi possível guardar a requisição, terá que efetuar o processo',
              ),
            );
    }
  }

  Future<Either<Failures, bool>> deleteHeroes(RequestModel parameters) async {
    if (parameters.id == null || parameters.id == 0) {
      return Left(
        Errors(message: 'Para atualizar se faz necessário informar o ID'),
      );
    }

    bool isConnection = await checkInternet.isConnection();
    late Errors results;
    if (isConnection) {
      final result = await repository.deleteHeroes(parameters.id!);
      return result.fold(
        (l) {
          if (l is UnknownError) {
            results = Errors(message: (l).message.toString());
          } else if (l is RestClientExceptionError) {
            results = Errors(message: (l).message.toString());
          }
          return Left(results);
        },
        (r) => Right(r),
      );
    } else {
      final params = RequestModelStorage(
        id: parameters.id,
        name: parameters.name,
        active: parameters.active == true ? 1 : 0,
        categoryId: parameters.categoryId,
        created: DateTime.now().microsecondsSinceEpoch,
        typeRequest: "DELETE",
      );
      int? response = await requestBaseDao.save(params);
      return response > 0
          ? const Right(true)
          : Left(
              Errors(
                message:
                    'Não foi possível guardar a requisição, terá que efetuar o processo',
              ),
            );
    }
  }
}
