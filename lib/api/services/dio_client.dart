import 'package:dio/dio.dart';

import 'package:training_and_testing/api/utils/dio_intercepter.dart';

abstract class DioClient {
  /// Creates a new Dio instance with the [baseUrl] and [headers].
  /// Useful when you need to provide custom headers :)
  static Dio client({
    bool debug = false,
    String baseUrl = '',
    Map<String, dynamic> headers = const {},
  }) {
    if (debug) {
      return Dio(
        BaseOptions(
          baseUrl: baseUrl,
          headers: headers,
        ),
      )..interceptors.add(DioIntercepter.interceptor());
    } else {
      return Dio(
        BaseOptions(
          baseUrl: baseUrl,
          headers: headers,
        ),
      );
    }
  }
}
