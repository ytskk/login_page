import 'package:dio/dio.dart';

import '../exceptions/api_exceptions.dart';

abstract class GetRequestHandler {
  GetRequestHandler(this._dioClient);
  final Dio _dioClient;

  Future<T> performRequest<T>(String path, T Function(dynamic data) fromJson,
      {required String userId}) async {
    try {
      final response = await _dioClient.get(
        path,
        queryParameters: {
          'userId': userId,
        },
      );
      return fromJson(response.data['data']);
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
      message: e.response?.data['status']['message'],
      code: e.response?.statusCode,
    );
  }
}
