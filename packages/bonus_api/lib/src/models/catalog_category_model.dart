// {
//     "id": "3f6a966d-733d-43c8-969a-46564b3589e9",
//     "name": "Dishes",
//     "slug": "dishes"
//   },

import 'package:json_annotation/json_annotation.dart';

part 'catalog_category_model.g.dart';

@JsonSerializable()
class CatalogCategoryModel {
  CatalogCategoryModel({
    required this.id,
    required this.name,
    required this.slug,
  });

  final String id;
  final String name;
  final String slug;

  factory CatalogCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CatalogCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogCategoryModelToJson(this);
}
