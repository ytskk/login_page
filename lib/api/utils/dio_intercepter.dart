import 'dart:developer';

import 'package:dio/dio.dart';

abstract class DioIntercepter {
  static InterceptorsWrapper interceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        log(
          'Request: ${options.method} ${options.path}',
          name: 'Dio request',
        );
        log(
          'Query parameters: ${options.queryParameters}',
          name: 'Dio request',
        );
        handler.next(options);
      },
      onResponse: (response, handler) {
        log(
          'Response: ${response.data}',
          name: 'Dio response',
        );
        handler.next(response);
      },
      onError: (error, handler) {
        log(
          'Error: ${error.message}',
          name: 'Dio error',
        );
        handler.next(error);
      },
    );
  }
}
