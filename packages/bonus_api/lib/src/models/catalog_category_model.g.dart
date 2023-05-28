// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatalogCategoryModel _$CatalogCategoryModelFromJson(
        Map<String, dynamic> json) =>
    CatalogCategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$CatalogCategoryModelToJson(
        CatalogCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };
