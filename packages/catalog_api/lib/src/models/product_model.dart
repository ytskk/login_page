class ProductModel {
  const ProductModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.status,
    required this.categorySlug,
    required this.categoryName,
    this.description,
    bool? isNew,
    this.price,
    this.options,
  }) : isNew = isNew ?? false;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String,
      status: ProductStatus.fromInt(json['status'] as int),
      isNew: json['isNew'] as bool?,
      price: json['price'] as int?,
      categorySlug: json['categorySlug'] as String,
      options: (json['options'] as List<dynamic>?)?.cast<String>(),
      categoryName: json['categoryName'] as String,
    );
  }

  final String id;
  final String title;
  final String? description;
  final String imageUrl;
  final ProductStatus status;
  final bool isNew;
  final int? price;
  final String categorySlug;
  final String categoryName;

  /// This is a list of options for the product. Ex - Size, Color, etc.
  final List<String>? options;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'imageUrl': imageUrl,
        'status': status.toInt(),
        'isNew': isNew,
        'price': price,
        'categorySlug': categorySlug,
        'options': options,
        'categoryName': categoryName,
      };

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, description: $description, imageUrl: $imageUrl, status: $status, isNew: $isNew, price: $price)';
  }
}

enum ProductStatus {
  available(0),
  soon(1),
  addedToCart(2),
  ;

  const ProductStatus(this.status);

  factory ProductStatus.fromInt(int status) {
    switch (status) {
      case 0:
        return ProductStatus.available;
      case 1:
        return ProductStatus.soon;
      case 2:
        return ProductStatus.addedToCart;
      default:
        throw Exception('Unknown status');
    }
  }

  final int status;

  int toInt() => status;
}
