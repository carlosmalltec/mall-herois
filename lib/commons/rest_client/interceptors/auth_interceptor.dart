import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.extra['auth_required'] == true) {
      const accessKey = String.fromEnvironment('ACCESS_TOKEN');
      options.headers['accessKey'] = accessKey;
      options.headers['content-type'] = 'application/json';
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.requestOptions.extra['auth_required'] == true) {
      final statusCode = err.response?.statusCode;
      if (statusCode == 401) {
        handler.reject(err);
      }
    }
    handler.next(err);
  }
}
