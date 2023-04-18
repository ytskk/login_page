class OrderItemModel {
  const OrderItemModel({
    required this.imageUrl,
    required this.name,
    required this.quantity,
    required this.size
  });

  final String imageUrl;
  final String name;
  final int quantity;
  final String size;


  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      imageUrl: json['imageUrl'],
      name: json['name'],
      quantity: json['quantity'],
      size: json['size'],
    );
  }

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
