import 'package:bonus_api/bonus_api.dart';
import 'package:bonus_repository/bonus_repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  UserController({
    required IBonusRepository bonusRepository,
  }) : _bonusRepository = bonusRepository;

  final IBonusRepository _bonusRepository;

  // definitions

  // TODO: replace with real user id from auth
  final _userId = 'one';

  late final _userBalance = Rx<Future<UserBalanceModel>>(
    _bonusRepository.getUserBalance(userId: _userId),
  );

  Rx<Future<UserBalanceModel>> get userBalance => _userBalance;

  // Rxn<Future<UserBalanceModel>> get userBalanceValue {
  //   if (_userBalance.value == null) {
  //     getUserBalance();
  //   }
  //   return _userBalance;
  // }

  // // methods

  Future<void> getUserBalance() async {
    _userBalance.value = _bonusRepository.getUserBalance(userId: _userId);
  }
}
