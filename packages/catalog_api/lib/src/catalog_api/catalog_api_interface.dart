import 'package:catalog_api/catalog_api.dart';

abstract class CatalogApiInterface {
  Future<List<ProductModel>> getProducts([String? categorySlug]);
  Future<List<CategoryModel>> getAllCategories();
}
