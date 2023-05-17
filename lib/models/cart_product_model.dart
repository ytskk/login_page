import 'package:catalog_api/catalog_api.dart';

/// [ProductModel] with additional [quantity] and [option] fields.
class CartProductModel extends ProductModel {
  const CartProductModel({
    required super.id,
    required super.title,
    required super.imageUrl,
    required super.status,
    required super.categorySlug,
    required super.categoryName,
    required this.quantity,
    super.description,
    super.price,
    this.option,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String,
      status: ProductStatus.fromInt(json['status'] as int),
      price: json['price'] as int?,
      categorySlug: json['categorySlug'] as String,
      categoryName: json['categoryName'] as String,
      quantity: json['quantity'] as int,
      option: json['option'] as String?,
    );
  }

  final int quantity;
  final String? option;

  @override
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data['quantity'] = quantity;
    data['option'] = option;

    return data;
  }
}
