import 'package:malltec_heroes/services/rest_client/failures.dart';

class RestClientExceptionError implements Failures {
  final String? message;

  RestClientExceptionError({
    this.message = 'Error da API',
  });
}
