import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/api/bonuses_api.dart';
import 'package:training_and_testing/constants/app_enums.dart';
import 'package:training_and_testing/models/models.dart';

class NotificationScreenController extends GetxController {
  NotificationScreenController(this._bonusesApi, this.userId);

  String userId;
  final BonusesApi? _bonusesApi;

  final Rx<NotificationsModel?> userNotifications =
      Rx<NotificationsModel?>(null);
  
  final Rx<Map<NotificationType, List<String>>> mapTypes =
      Rx<Map<NotificationType, List<String>>>({});
  
  final Rx<NotificationType?> selectedFilterType = Rx<NotificationType?>(null);

  List<NotificationType?> get listTypes =>
      [null, ...?userNotifications.value?.mapTypes.keys];

  @override
  void onInit() {
    ever(selectedFilterType, (_) => updateUserNotifications());
    super.onInit();
  }

  Future<void> updateUserNotifications() async {
    userNotifications.value =
        await _bonusesApi?.apiGetRequests.getNotificationsByType(
      userId: userId,
      types: mapTypes.value[selectedFilterType.value] ?? [],
    );
    mapTypes.value = userNotifications.value?.mapTypes ?? {};
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

  // Future<bool> _setRemoteNotificationStatus(required String? notificationId,
  //   required bool status,){
  //   return _putRequestChangeNotificationStatus(notificationId ,
  //   required bool status,);
  // }

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
}
