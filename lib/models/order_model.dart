import 'package:training_and_testing/models/models.dart';

class OrderModel {
  const OrderModel({
    required this.totalItems,
    required this.orderId,
    required this.orderDated,
    required this.orderStatus,
    required this.shippingDetail,
    required this.items,
  });

  final int totalItems;
  final String orderId;
  final String orderDated;
  final String orderStatus;
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
      'orderStatus': orderStatus,
      'shippingDetail': shippingDetail.toJson(),
      'items': List<dynamic>.from(items.map((x) => x.toJson())),
    };
  }

  @override
  String toString() {
    return 'OrderModel(totalItems: $totalItems, orderId: $orderId, orderDated: $orderDated, orderStatus: $orderStatus, shippingDetail: $shippingDetail, items: $items)';
  }
}
