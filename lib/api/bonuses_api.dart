import 'package:training_and_testing/api/requests/get_requests.dart';

import 'config.dart';
import 'services/dio_client.dart';

class BonusesApi {
  final _dioClient = DioClient.client(
    debug: BonusesApiConfig.debug,
    baseUrl: BonusesApiConfig.baseUrl,
  );

  get apiGetRequests => GetRequests(dioClient: _dioClient);
}
