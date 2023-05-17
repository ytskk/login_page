import 'package:training_and_testing/models/models.dart';
import 'package:training_and_testing/utils/extensions/extensions.dart';

import '../constants/app_enums.dart';

class NotificationsModel {
  NotificationsModel({
    required this.totalNotifications,
    required this.totalNewNotifications,
    required List<String> listTypes,
    required this.notifications,
  }) : _listTypes = listTypes;

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      totalNotifications: json['totalNotifications'] as int,
      totalNewNotifications: json['totalNewNotifications'] as int,
      listTypes: List<String>.from(json['listTypes'] as List),
      notifications: List<NotificationItemModel>.from(
        (json['notifications'] as List<dynamic>).map(
          (item) => NotificationItemModel.fromJson(
            item as Map<String, dynamic>,
          ),
        ),
      ),
    );
  }

  final int totalNotifications;
  final List<NotificationItemModel> notifications;
  final List<String> _listTypes;
  int totalNewNotifications;

  Map<NotificationType, List<String>> get mapTypes {
    final res = <NotificationType, List<String>>{};
    for (final type in _listTypes) {
      final enumType = type.toEnum<NotificationType>(NotificationType.values) ??
          NotificationType.other;
      (res.containsKey(enumType))
          ? res[enumType]?.add(type)
          : res[enumType] = [type];
    }
    return res;
  }

  Map<String, dynamic> toJson() {
    return {
      'totalNotifications': totalNotifications,
      'totalNewNotifications': totalNewNotifications,
      'listTypes': _listTypes,
      'notifications':
          notifications.map((notification) => notification.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return <String>[
      'NotificationsModel(',
      'totalNotifications: $totalNotifications, ',
      'listTypes: $_listTypes, ',
      'notifications: $notifications, ',
      'totalNewNotifications: $totalNewNotifications)'
    ].join();
  }
}
