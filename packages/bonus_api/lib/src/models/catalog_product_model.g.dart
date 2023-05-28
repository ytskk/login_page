// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatalogProductModel _$CatalogProductModelFromJson(Map<String, dynamic> json) =>
    CatalogProductModel(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String?,
      price: json['price'] as int?,
      status: json['status'] as int,
      isNew: json['isNew'] as bool,
      categorySlug: json['categorySlug'] as String,
      categoryName: json['categoryName'] as String,
    );

Map<String, dynamic> _$CatalogProductModelToJson(
        CatalogProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'price': instance.price,
      'status': instance.status,
      'isNew': instance.isNew,
      'categorySlug': instance.categorySlug,
      'categoryName': instance.categoryName,
    };
