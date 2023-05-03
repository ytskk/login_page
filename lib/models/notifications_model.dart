import 'package:training_and_testing/models/models.dart';

class NotificationsModel {
  NotificationsModel({
    required this.totalNotifications,
    required this.totalNewNotifications,
    required this.notifications,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      totalNotifications: json['totalNotifications'] as int,
      totalNewNotifications: json['totalNewNotifications'] as int,
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
  int totalNewNotifications;

  Map<String, dynamic> toJson() {
    return {
      'totalNotifications': totalNotifications,
      'totalNewNotifications': totalNewNotifications,
      'notifications': notifications
          .map((notification) => notification.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'NotificationsModel(totalNotifications: $totalNotifications, notifications: $notifications , totalNewNotifications: $totalNewNotifications)';
  }
}
