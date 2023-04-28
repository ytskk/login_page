class OrderItemModel {
  const OrderItemModel({
    required this.imageUrl,
    required this.name,
    required this.quantity,
    required this.size,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      size: json['size'] as String,
    );
  }

  final String imageUrl;
  final String name;
  final int quantity;
  final String size;

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'quantity': quantity,
      'size': size,
    };
  }

  @override
  String toString() {
    return 'OrderItemModel(imageUrl: $imageUrl, name: $name, quantity: $quantity, size: $size)';
  }
}
