import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/api/bonuses_api.dart';
import 'package:training_and_testing/models/models.dart';

class NotificationScreenController extends GetxController {
  NotificationScreenController(this._bonusesApi, this.userId);

  //
  String userId;

  //
  final BonusesApi? _bonusesApi;

  ///
  ///
  final notificationCategoryList = Rx<NotificationCategoryListModel?>(null);

  /// Map, where key is notification category identifier (categorySlug)
  /// and the value is name of notification category
  ///
  final mapCategories = Rx<Map<String, String>>({});

  /// specified filter
  ///
  final filterCategory = Rx<String?>(null);

  ///
  ///
  final loadQueue = <Future<NotificationsModel>?>[].obs;

  ///
  ///
  final dataByCategory = Rx<Map<String?, NotificationsModel?>>({null: null});

  /// getter forming a list of filters
  ///
  List<String?> get listCategories => [null, ...mapCategories.value.keys];

  @override
  void onInit() {
    ever(filterCategory, (_) => updateUserNotifications());
    updateCategories();
    super.onInit();
  }

  /// [dataByCategory] update according to filter [filterCategory] set
  ///
  ///
  Future<void> updateUserNotifications({int? countNotifications = 10}) async {
    final task = _bonusesApi?.apiGetRequests.getNotificationsByCategory(
      userId: userId,
      filter: filterCategory.value,
      count: countNotifications,
    );
    loadQueue.add(task);
    dataByCategory.value[filterCategory.value] = await loadQueue.last;
    loadQueue.remove(task);
  }

  ///
  ///
  Future<void> updateCategories() async {
    notificationCategoryList.value =
        await _bonusesApi?.apiGetRequests.getNotificationCategoryList();
    mapCategories.value = notificationCategoryList.value?.mapCategories ?? {};
  }

  /// changes notification status to the opposite
  ///
  Future<bool> reverseNotificationStatus(int index) async {
    var result = false;
    final currentStatus =
        dataByCategory.value[filterCategory.value]?.notifications[index].isNew;
    if (currentStatus != null) {
      // local change of notification status value
      _setLocalNotificationStatus(
        index: index,
        currentStatus: currentStatus,
      );
      // remote change of notification status value
      result = await _putRequestChangeNotificationStatus(
        notificationId:
            dataByCategory.value[filterCategory.value]?.notifications[index].id,
        status: !currentStatus,
      );
      // return to the previous values if the request is unsuccessful
      if (!result) {
        _setLocalNotificationStatus(
          index: index,
          currentStatus: !currentStatus,
        );
      }
    }
    return result;
  }

  /// function of local change of notification status value
  ///
  void _setLocalNotificationStatus({
    required int index,
    required bool currentStatus,
  }) {
    dataByCategory.update((val) {
      final curNoticeList = val?[filterCategory.value];
      if (curNoticeList != null) {
        curNoticeList.notifications[index].isNew = !currentStatus;
        currentStatus
            ? curNoticeList.totalNewNotifications--
            : curNoticeList.totalNewNotifications++;
      }
    });
  }

  // TODO: move to api
  Future<bool> _putRequestChangeNotificationStatus({
    required String? notificationId,
    required bool status,
  }) async {
    try {
      final dio = Dio();
      final response = await dio.put(
        'http://185.232.169.195/notifications?userId=2',
        data: {'notificationId': '$notificationId', 'isNew': status},
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
