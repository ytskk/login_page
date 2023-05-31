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
      status: $enumDecode(_$CatalogProductStatusEnumMap, json['status']),
      isNew: json['isNew'] as bool,
      category: CatalogCategoryModel.fromJson(
          json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CatalogProductModelToJson(
        CatalogProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'price': instance.price,
      'status': _$CatalogProductStatusEnumMap[instance.status]!,
      'isNew': instance.isNew,
      'category': instance.category,
    };

const _$CatalogProductStatusEnumMap = {
  CatalogProductStatus.available: 0,
  CatalogProductStatus.soon: 1,
  CatalogProductStatus.addedToCart: 2,
};
