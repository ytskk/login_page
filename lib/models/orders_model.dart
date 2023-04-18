import 'order_model.dart';

class OrdersModel {
  const OrdersModel({
    required this.totalOrders,
    required this.orders,
  });

  final int totalOrders;
  final List<OrderModel> orders;

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
      totalOrders: json['totalOrders'],
      orders: List<OrderModel>.from(
        json['orders'].map(
          (order) => OrderModel.fromJson(order),
        ),
      ),
    );
  }

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
