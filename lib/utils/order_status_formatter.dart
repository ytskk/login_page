import '../constants/app_enums.dart';
import '../generated/locale_keys.g.dart';

class OrderStatusFormatter {
  static String format(String status) {
    final orderStatus = OrderSatus.values.firstWhere(
      (e) => e.toString().split('.').last == status,
      orElse: () => OrderSatus.unknown,
    );
    switch (orderStatus) {
      case OrderSatus.canceled:
        return LocaleKeys.canceled;
      case OrderSatus.delivered:
        return LocaleKeys.delivered;
      case OrderSatus.waitingForDelivery:
        return LocaleKeys.waiting_for_delivery;
      default:
        return LocaleKeys.unknown;
    }
  }
}
