abstract class Failures implements Exception {}

class ExceptionGeneric implements Failures {
  final String message;
  final int statusCode;
  final String? path;
  final dynamic error;

  ExceptionGeneric(
      {required this.message, this.path, this.statusCode = 2000, this.error});

  @override
  String toString() {
    return '''
              ExceptionGeneric:
              path: $path 
              message: $message 
              statusCode: $statusCode
              error: $error
            ''';
  }
}
