import 'package:training_and_testing/constants/app_enums.dart';
import 'package:training_and_testing/models/models.dart';
import 'package:training_and_testing/utils/extensions/extensions.dart';

class OrderModel {
  const OrderModel({
    required this.totalItems,
    required this.orderId,
    required this.orderDated,
    required String orderStatus,
    required this.shippingDetail,
    required this.items,
  }) : _orderStatus = orderStatus;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalItems: json['totalItems'] as int,
      orderId: json['orderId'] as String,
      orderDated: json['orderDated'] as String,
      orderStatus: json['orderStatus'] as String,
      shippingDetail: ShippingDetailModel.fromJson(
        json['shippingDetail'] as Map<String, dynamic>,
      ),
      items: List<OrderItemModel>.from(
        (json['items'] as List<dynamic>).map(
          (item) => OrderItemModel.fromJson(item as Map<String, dynamic>),
        ),
      ),
    );
  }

  final int totalItems;
  final String orderId;
  final String orderDated;
  final String _orderStatus;
  final ShippingDetailModel shippingDetail;
  final List<OrderItemModel> items;

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
      _orderStatus.toEnum<OrderStatus>(OrderStatus.values) ??
      OrderStatus.canceled;

  @override
  String toString() {
    return 'OrderModel(totalItems: $totalItems, orderId: $orderId, orderDated: $orderDated, orderStatus: $orderStatus, shippingDetail: $shippingDetail, items: $items)';
  }
}
