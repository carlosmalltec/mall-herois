import 'package:malltec_heroes/services/rest_client/failures.dart';

class Errors implements Failures {
  final String? message;

  Errors({
    this.message = 'Error desconhecido',
  });
}
