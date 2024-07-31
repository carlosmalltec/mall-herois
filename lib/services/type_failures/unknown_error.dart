import 'package:malltec_heroes/services/rest_client/failures.dart';

class UnknownError implements Failures {
  final String? message;

  UnknownError({
    this.message = 'Error desconhecido',
  });
}
