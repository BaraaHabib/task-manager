


import 'package:dio/dio.dart';

/// {@template auth_interceptor}
/// add auth properties before sending request
/// {@endtemplate}

class BasicAuthInterceptor extends Interceptor {

  /// {@macro auth_interceptor}
  BasicAuthInterceptor({required this.token});

  ///
  final String? token;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// don't add token to amazon requests
      options.headers = options.headers
        ..update(
          'Authorization',
              (V) => 'Bearer $token',
          ifAbsent: () => 'Bearer $token',
        );
    handler.next(options);
  }
}