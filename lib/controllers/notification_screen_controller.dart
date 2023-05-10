import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:training_and_testing/api/bonuses_api.dart';
import 'package:training_and_testing/models/models.dart';

class NotificationScreenController extends GetxController {
  NotificationScreenController(this._bonusesApi, this.userId);

  // TODO: set final 
  String userId;
  final BonusesApi? _bonusesApi;
  final Rx<NotificationsModel?> userNotifications =
      Rx<NotificationsModel?>(null);
  Rx<int?> filter = 1.obs; 

  Future<void> updateUserNotifications() async {
    userNotifications.value =
        await _bonusesApi?.apiGetRequests.getNotifications(userId: userId);
  }

  void _setLocalNotificationStatus({
    required int index,
    required bool currentStatus,
  }) {
    userNotifications.update((val) {
      if (val != null) {
        val.notifications[index].isNew = !currentStatus;
        currentStatus
            ? val.totalNewNotifications--
            : val.totalNewNotifications++;
      }
    });
  }

  Future<bool> _putRequestChangeNotificationStatus({
    required String? notificationId,
    required bool status,
  }) async {
    try {
      final dio = Dio();
      final response = await dio.put(
        'http://185.232.169.195/notifications?userId=1',
        data: {'notificationId': '$notificationId e', 'isNew': status},
      );
      if (response.statusCode == 200) {
        log(response.data.toString());
        return true;
      } else {
        log('Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  // changes notification status to the opposite
  Future<void> reverseNotificationStatus(int index) async {
    final currentStatus = userNotifications.value?.notifications[index].isNew;
    if (currentStatus != null) {
      _setLocalNotificationStatus(
        index: index,
        currentStatus: currentStatus,
      );
      final result = await _putRequestChangeNotificationStatus(
        notificationId: userNotifications.value?.notifications[index].id,
        status: !currentStatus,
      );
      if (!result) {
        _setLocalNotificationStatus(
          index: index,
          currentStatus: !currentStatus,
        );
      }
    }
  }
}
