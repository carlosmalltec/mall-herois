import 'package:malltec_heroes/services/rest_client/failures.dart';

class FormatExceptionDecode implements Failures {
  final String? message;

  FormatExceptionDecode({
    this.message = 'Problema para fazer o decode da lista',
  });
}
