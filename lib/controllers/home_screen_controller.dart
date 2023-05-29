import 'package:get/get.dart';

import 'package:training_and_testing/api/bonuses_api.dart';
import 'package:training_and_testing/models/models.dart';

class HomeScreenController extends GetxController {
  HomeScreenController(this._bonusesApi, this.userId);

  final String userId;
  final BonusesApi? _bonusesApi;
  final Rx<BalanceModel?> userBalance = Rx<BalanceModel?>(null);
  final Rx<AchievementsModel?> userAchievements = Rx<AchievementsModel?>(null);
  final Rx<OrdersModel?> userOrders = Rx<OrdersModel?>(null);
  final Rx<OperationsModel?> userOperations = Rx<OperationsModel?>(null);

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
}
