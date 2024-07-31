
import '../rest_client/failures.dart';

class NotFoundResult implements Failures {
  final String? message;

  NotFoundResult({
    this.message = 'Resultado não encontrado',
  });
}
