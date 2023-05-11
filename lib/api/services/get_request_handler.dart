import 'package:dio/dio.dart';

import 'package:training_and_testing/api/exceptions/api_exceptions.dart';

abstract class GetRequestHandler {
  GetRequestHandler(this._dioClient);
  final Dio _dioClient;

  Future<T> performRequest<T>(
    String path,
    T Function(Map<String, dynamic> data) fromJson, {
    required String userId,
    Map<String, String>? queryParams,
  }) async {
    try {
      final response = await _dioClient.get(
        path,
        queryParameters: {'userId': userId}..addAll(queryParams ?? {})
      );
      return fromJson(response.data['data'] as Map<String, dynamic>);
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  BonusesApiException _handleError(DioError e) {
    if (e.response?.data['status'] == null) {
      return BonusesApiException(
        message: 'Dio error${e.message ?? ''}',
        code: e.response?.statusCode,
      );
    }
    return BonusesApiException(
      message: e.response?.data['status']['message'] as String?,
      code: e.response?.statusCode,
    );
  }
}
