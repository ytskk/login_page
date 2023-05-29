import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'catalog_category_model.g.dart';

@JsonSerializable()
class CatalogCategoryModel extends Equatable {
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

  @override
  List<Object?> get props => [id, name, slug];
}
