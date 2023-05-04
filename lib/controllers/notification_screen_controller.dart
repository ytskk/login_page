import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:training_and_testing/api/bonuses_api.dart';
import 'package:training_and_testing/models/models.dart';

class NotificationScreenController extends GetxController {
  NotificationScreenController(this._bonusesApi, this.userId);

  final String userId;
  final BonusesApi? _bonusesApi;
  final Rx<NotificationsModel?> userNotifications =
      Rx<NotificationsModel?>(null);

  @override
  void onInit(){
    super.onInit();
    updateUserNotifications();
  }

  Future<void> updateUserNotifications() async {
    userNotifications.value =
        await _bonusesApi?.apiGetRequests.getNotifications(userId: userId);
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
