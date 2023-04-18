import 'package:dio/dio.dart';


import '../../models/models.dart';
import '../services/get_request_handler.dart';
import 'bonuses_api_requests.dart';
import 'get_requests_interface.dart';

class GetRequests extends GetRequestHandler implements BonusesApiInterface  {
  GetRequests({
    required Dio dioClient,
  }) : super(dioClient);

  @override
  Future<BalanceModel> getBalance({required String userId}) async {
    return await performRequest(
      BonusesApiRequests.balance,
      (data) => BalanceModel.fromJson(data),
      userId: userId,
    );
  }

  @override
  Future<AchievementsModel> getAchievements({required String userId}) async {
    return performRequest(
      BonusesApiRequests.achievements,
      (data) => AchievementsModel.fromJson(data),
      userId: userId,
    );
  }

  @override
  Future<OrdersModel> getOrders({required String userId}) async {
    return performRequest(
      BonusesApiRequests.orders,
      (data) => OrdersModel.fromJson(data),
      userId: userId,
    );
  }

  @override
  Future<OperationsModel> getOperations({required String userId}) async {
    return performRequest(
      BonusesApiRequests.operations,
      (data) => OperationsModel.fromJson(data),
      userId: userId,
    );
  }
}
