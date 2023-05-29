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

  @override
  Future<NotificationsModel> getNotificationsByCategory({
    required String userId,
    String? filter,
    int? count,
  }) async {
    final queryParams = <String, String>{};
    if (filter != null) queryParams.addAll({'filter': filter});
    if (count != null) queryParams.addAll({'count': '$count'});
    return performRequest(
      BonusesApiEndpoints.notifications,
      NotificationsModel.fromJson,
      userId: userId,
      queryParams: queryParams,
    );
  }

  @override
  Future<NotificationCategoryListModel> getNotificationCategoryList(
      {String? locale}) async {
    return performRequest(
      BonusesApiEndpoints.notificationsCategory,
      NotificationCategoryListModel.fromJson,
    );
  }

  @override
  Future<FaqModel> getFAQ({String? locale}) async {
    return performRequest(
      BonusesApiEndpoints.faq,
      FaqModel.fromJson,
    );
  }
}
