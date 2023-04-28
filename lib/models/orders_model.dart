import 'package:training_and_testing/models/order_model.dart';

class OrdersModel {
  const OrdersModel({
    required this.totalOrders,
    required this.orders,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
      totalOrders: json['totalOrders'] as int,
      orders: List<OrderModel>.from(
        (json['orders'] as List<dynamic>).map(
          (order) => OrderModel.fromJson(order as Map<String, dynamic>),
        ),
      ),
    );
  }

  final int totalOrders;
  final List<OrderModel> orders;

  Map<String, dynamic> toJson() {
    return {
      'totalOrders': totalOrders,
      'items': List<dynamic>.from(orders.map((x) => x.toJson())),
    };
  }

  @override
  String toString() {
    return 'OrdersModel(totalOrders: $totalOrders, orders: $orders)';
  }
}
