import '../../models/achievements_model.dart';
import '../../models/balance_model.dart';
import '../../models/operations_model.dart';
import '../../models/orders_model.dart';

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
}
