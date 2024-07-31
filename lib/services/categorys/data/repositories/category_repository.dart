import 'package:dartz/dartz.dart';
import 'package:malltec_heroes/constants/const_urls.dart';
import 'package:malltec_heroes/services/rest_client/failures.dart';

import '../../../type_failures/format_exception_decode.dart';
import '../../../type_failures/rest_client_exception_error.dart';
import '../../data/models/category_model.dart';
import '../../../rest_client/rest_client_library.dart';
import '../../../type_failures/not_found_result.dart';
import '../../../type_failures/unknown_error.dart';

class CategoryRepository {
  final RestClient restClient;
  CategoryRepository(this.restClient);

  Future<Either<Failures, List<CategoryModel>?>> findAllCategory() async {
    try {
      RestClientResponse result = await restClient.auth().get(ConstUrls.category);
      if (result.statusCode == 200) {
        final response = result.data['Items'] as List<dynamic>;
        final results = response
            .map<CategoryModel>((categorys) => CategoryModel.fromMap(categorys))
            .toList();
        return Right(results);
      }

      return Left(NotFoundResult(message: "Nenhum resutado encontrado"));
    } on RestClientException catch (e) {
      return Left(RestClientExceptionError(message: e.toString()));
    } on FormatException {
      return Left(FormatExceptionDecode(
          message: "Falha interna, não foi possível fazer o decode."));
    } catch (e) {
      return Left(UnknownError(message: e.toString()));
    }
  }
}
