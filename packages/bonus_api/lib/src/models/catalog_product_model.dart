import 'package:json_annotation/json_annotation.dart';

part 'catalog_product_model.g.dart';

@JsonSerializable()
class CatalogProductModel {
  const CatalogProductModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.description,
    this.price,
    required this.status,
    required this.isNew,
    required this.categorySlug,
    required this.categoryName,
  });

  final String id;
  final String title;
  final String imageUrl;
  final String? description;
  final int? price;
  final CatalogProductStatus status;
  final bool isNew;
  final String categorySlug;
  final String categoryName;

  factory CatalogProductModel.fromJson(Map<String, dynamic> json) =>
      _$CatalogProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogProductModelToJson(this);
}

enum CatalogProductStatus {
  @JsonValue(0)
  available,
  @JsonValue(1)
  soon,
  @JsonValue(2)
  addedToCart,
}
