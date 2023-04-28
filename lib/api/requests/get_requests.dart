import 'package:dio/dio.dart';
import 'package:training_and_testing/api/requests/bonuses_api_requests.dart';
import 'package:training_and_testing/api/requests/get_requests_interface.dart';
import 'package:training_and_testing/api/services/get_request_handler.dart';
import 'package:training_and_testing/models/models.dart';

class GetRequests extends GetRequestHandler implements BonusesApiInterface {
  GetRequests({
    required Dio dioClient,
  }) : super(dioClient);

  @override
  Future<BalanceModel> getBalance({required String userId}) async {
    return performRequest(
      BonusesApiEndpoints.balance,
      BalanceModel.fromJson,
      userId: userId,
    );
  }

  @override
  Future<AchievementsModel> getAchievements({required String userId}) async {
    return performRequest(
      BonusesApiEndpoints.achievements,
      AchievementsModel.fromJson,
      userId: userId,
    );
  }

  @override
  Future<OrdersModel> getOrders({required String userId}) async {
    return performRequest(
      BonusesApiEndpoints.orders,
      OrdersModel.fromJson,
      userId: userId,
    );
  }

  @override
  Future<OperationsModel> getOperations({required String userId}) async {
    return performRequest(
      BonusesApiEndpoints.operations,
      OperationsModel.fromJson,
      userId: userId,
    );
  }
}
