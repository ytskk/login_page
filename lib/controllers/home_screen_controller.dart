import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:training_and_testing/api/bonuses_api.dart';
import 'package:training_and_testing/models/models.dart';

class HomeScreenController extends GetxController {
  HomeScreenController(this._bonusesApi, this.userId);

  final String userId;
  final BonusesApi? _bonusesApi;
  final Rx<NotificationsModel?> userNotifications =
      Rx<NotificationsModel?>(null);
  final Rx<BalanceModel?> userBalance = Rx<BalanceModel?>(null);
  final Rx<AchievementsModel?> userAchievements = Rx<AchievementsModel?>(null);
  final Rx<OrdersModel?> userOrders = Rx<OrdersModel?>(null);
  final Rx<OperationsModel?> userOperations = Rx<OperationsModel?>(null);

  Future<void> updateUserNotifications() async {
    userNotifications.value =
        await _bonusesApi?.apiGetRequests.getNotifications(userId: userId);
  }

  Future<void> updateUserBalance() async {
    userBalance.value =
        await _bonusesApi?.apiGetRequests.getBalance(userId: userId);
  }

  Future<void> updateUserAchievements() async {
    userAchievements.value =
        await _bonusesApi?.apiGetRequests.getAchievements(userId: userId);
  }

  Future<void> updateUserOrders() async {
    userOrders.value =
        await _bonusesApi?.apiGetRequests.getOrders(userId: userId);
  }

  Future<void> updateUserOperations() async {
    userOperations.value =
        await _bonusesApi?.apiGetRequests.getOperations(userId: userId);
  }

  // changes notification status to the opposite
  void reverseNotificationHideStatus(int index) => {
        userNotifications.update((val) {
          if (val != null) {
            final currentStatus = val.notifications[index].isNew;
            val.notifications[index].isNew = !currentStatus;
            currentStatus
                ? val.totalNewNotifications--
                : val.totalNewNotifications++;
          }
        })
      };

  // TODO(all): move to api class
  Future<void> submitChangesUserNotifications() async {
    final data = userNotifications.value;
    if (data != null) {
      final dio = Dio();
      try {
        final response = await dio.post(
          'http://185.232.169.195/notifications',
          data: {'data': data.toJson()},
        );
        if (response.statusCode == 201) {
          print(response.data);
        } else {
          print('Status code: ${response.statusCode}');
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
