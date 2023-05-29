import 'package:training_and_testing/models/achievements_model.dart';
import 'package:training_and_testing/models/models.dart';

abstract class BonusesApiInterface {
  /// Returns a [BalanceModel] with the current balance of the user by [userId].
  Future<BalanceModel> getBalance({required String userId});

  /// Returns a [AchievementsModel] with the list of achievements of the user
  /// by [userId].
  Future<AchievementsModel> getAchievements({required String userId});

  /// Returns a [OrdersModel] with the list of orders of the user
  /// by [userId].
  Future<OrdersModel> getOrders({required String userId});

  /// Returns a [OperationsModel] with the list of operations of the user
  /// by [userId].
  Future<OperationsModel> getOperations({required String userId});

  /// Returns a [NotificationsModel] with the list of notifications of the user
  /// by [userId].
  /// [filter] - filter by category
  /// [count] - amount of loaded
  Future<NotificationsModel> getNotificationsByCategory({
    required String userId,
    String? filter,
    int? count,
  });

  /// Returns [NotificationCategoryListModel] with the list of categories
  /// by [locale].
  Future<NotificationCategoryListModel> getNotificationCategoryList({
    String locale,
  });

  /// Returns [FaqModel] with the list of FAQ by [locale].
  Future<FaqModel> getFAQ({String locale});
}
