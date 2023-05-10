import 'package:dio/dio.dart';
import 'package:training_and_testing/api/config.dart';
import 'package:training_and_testing/api/requests/get_requests.dart';
import 'package:training_and_testing/api/services/dio_client.dart';

class BonusesApi {
  final Dio _dioClient = DioClient.client(
    baseUrl: BonusesApiConfig.baseUrl,
  );

  GetRequests get apiGetRequests => GetRequests(dioClient: _dioClient);
}
