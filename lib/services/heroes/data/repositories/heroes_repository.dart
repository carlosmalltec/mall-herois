import 'package:dartz/dartz.dart';
import 'package:malltec_heroes/constants/const_urls.dart';
import 'package:malltec_heroes/services/rest_client/failures.dart';

import '../../../rest_client/rest_client_library.dart';
import '../../../type_failures/not_found_result.dart';
import '../../../type_failures/unknown_error.dart';
import '../models/heroes_model.dart';

class HeroesRepository {
  final RestClient restClient;
  HeroesRepository(this.restClient);

  Future<Either<Failures, List<HeroesModel>?>> findAllHeroes() async {
    try {
      RestClientResponse result = await restClient.auth().get(ConstUrls.heroes);
      if (result.statusCode == 200) {
        final response = result as List<Map<String, dynamic>>;
        final results = response
            .map<HeroesModel>((heroes) => HeroesModel.fromMap(heroes))
            .toList();
        return Right(results);
      }

      return Left(NotFoundResult(message: "Nenhum resutado encontrado"));
    } on RestClientException catch (e) {
      return Left(UnknownError(message: e.toString()));
    } on FormatException {
      return Left(UnknownError(
          message: "Falha interna, não foi possível fazer o decode."));
    } catch (e) {
      return Left(UnknownError(message: e.toString()));
    }
  }
  Future<Either<Failures, List<HeroesModel>?>> registerHeroes() async {
    try {
      RestClientResponse result = await restClient.auth().post(ConstUrls.heroes);
      if (result.statusCode == 200) {
        final response = result as List<Map<String, dynamic>>;
        final results = response
            .map<HeroesModel>((heroes) => HeroesModel.fromMap(heroes))
            .toList();
        return Right(results);
      }

      return Left(NotFoundResult(message: "Nenhum resutado encontrado"));
    } on RestClientException catch (e) {
      return Left(UnknownError(message: e.toString()));
    } on FormatException {
      return Left(UnknownError(
          message: "Falha interna, não foi possível fazer o decode."));
    } catch (e) {
      return Left(UnknownError(message: e.toString()));
    }
  }
}
