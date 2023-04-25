import 'package:training_and_testing/models/models.dart';

import '../constants/app_enums.dart';

class OrderModel {
  const OrderModel({
    required this.totalItems,
    required this.orderId,
    required this.orderDated,
    required orderStatus,
    required this.shippingDetail,
    required this.items,
  }) : _orderStatus = orderStatus;

  final int totalItems;
  final String orderId;
  final String orderDated;
  final String _orderStatus;
  final ShippingDetailModel shippingDetail;
  final List<OrderItemModel> items;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalItems: json['totalItems'],
      orderId: json['orderId'],
      orderDated: json['orderDated'],
      orderStatus: json['orderStatus'],
      shippingDetail: ShippingDetailModel.fromJson(json['shippingDetail']),
      items: List<OrderItemModel>.from(
        json['items'].map(
          (order) => OrderItemModel.fromJson(order),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalItems': totalItems,
      'orderId': orderId,
      'orderDated': orderDated,
      'orderStatus': _orderStatus,
      'shippingDetail': shippingDetail.toJson(),
      'items': List<dynamic>.from(items.map((x) => x.toJson())),
    };
  }

  Enum get orderStatus =>
      stringToEnum<OrderStatus>(_orderStatus, OrderStatus.values, OrderStatus.unknown);

  /// Generic method that returns [Enum.value] based on [string]
  /// or [defaultValue] if not found.
  // !!!
  T stringToEnum<T>(
      String string, List<T> values, T defaultValue) {
    return values.firstWhere(
      (type) => type.toString().split('.').last == string,
      orElse: () => defaultValue,
    );
  }

  @override
  String toString() {
    return 'OrderModel(totalItems: $totalItems, orderId: $orderId, orderDated: $orderDated, orderStatus: $orderStatus, shippingDetail: $shippingDetail, items: $items)';
  }
}
