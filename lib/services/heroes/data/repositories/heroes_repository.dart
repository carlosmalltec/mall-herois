import 'package:dartz/dartz.dart';
import 'package:malltec_heroes/constants/const_urls.dart';
import 'package:malltec_heroes/services/rest_client/failures.dart';

import '../../../rest_client/rest_client_library.dart';
import '../../../type_failures/format_exception_decode.dart';
import '../../../type_failures/not_found_result.dart';
import '../../../type_failures/rest_client_exception_error.dart';
import '../../../type_failures/unknown_error.dart';
import '../models/heroes_model.dart';
import '../models/request_model.dart';

class HeroesRepository {
  final RestClient restClient;
  HeroesRepository(this.restClient);

  Future<Either<Failures, List<HeroesModel>?>> findAllHeroes() async {
    try {
      RestClientResponse result = await restClient.auth().get(ConstUrls.heroes);
      if (result.statusCode == 200) {
        final response = result.data['Items'] as List<dynamic>;
        final results = response
            .map<HeroesModel>((herois) => HeroesModel.fromMap(herois))
            .toList();
        return Right(results);
      }

      return Left(NotFoundResult(message: "Nenhum resutado encontrado"));
    } on RestClientException catch (e) {
      if (e.response != null) {
        return Left(
            RestClientExceptionError(message: e.response?.data['Message']));
      }
      return Left(RestClientExceptionError(message: e.toString()));
    } on FormatException {
      return Left(FormatExceptionDecode(
          message: "Falha interna, não foi possível fazer o decode."));
    } catch (e) {
      return Left(UnknownError(message: "Não foi possível criar o registro"));
    }
  }

  Future<Either<Failures, bool>> registerHeroes(RequestModel parameters) async {
    try {
      RestClientResponse result = await restClient
          .auth()
          .post(ConstUrls.heroes, data: parameters.toMap());
      if (result.statusCode == 201) {
        return const Right(true);
      }

      return Left(UnknownError(message: "Não foi possível criar o registro"));
    } on RestClientException catch (e) {
      if (e.response != null) {
        return Left(
            RestClientExceptionError(message: e.response?.data['Message']));
      }
      return Left(RestClientExceptionError(message: e.toString()));
    } catch (e) {
      return Left(UnknownError(message: "Não foi possível criar o registro"));
    }
  }

  Future<Either<Failures, bool>> updateHeroes(RequestModel parameters) async {
    try {
      RestClientResponse result = await restClient.auth().put(
          "${ConstUrls.heroes}/${parameters.id}",
          data: parameters.toMap());
      if (result.statusCode == 200) {
        return const Right(true);
      }

      return Left(
          UnknownError(message: "Não foi possível atualizar o registro"));
    } on RestClientException catch (e) {
      if (e.response != null) {
        return Left(
            RestClientExceptionError(message: e.response?.data['Message']));
      }
      return Left(RestClientExceptionError(message: e.toString()));
    } catch (e) {
      return Left(
          UnknownError(message: "Não foi possível atualizar o registro"));
    }
  }

  Future<Either<Failures, bool>> deleteHeroes(int id) async {
    try {
      RestClientResponse result = await restClient.auth().delete(
            "${ConstUrls.heroes}/$id",
          );
      if (result.statusCode == 204) {
        return const Right(true);
      }

      return Left(UnknownError(message: "Não foi possível excluir o registro"));
    } on RestClientException catch (e) {
      if (e.response != null) {
        return Left(
            RestClientExceptionError(message: e.response?.data['Message']));
      }
      return Left(RestClientExceptionError(message: e.toString()));
    } catch (e) {
      return Left(UnknownError(message: "Não foi possível excluir o registro"));
    }
  }
}
