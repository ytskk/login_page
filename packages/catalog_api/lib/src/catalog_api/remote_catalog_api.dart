import 'package:catalog_api/catalog_api.dart';
import 'package:dio/dio.dart';

// TODO: add error handling
class RemoteCatalogApi implements CatalogApiInterface {
  const RemoteCatalogApi({
    required Dio dio,
  }) : _apiClient = dio;

  final Dio _apiClient;

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final response = await _apiClient.get<List<dynamic>>(
      CatalogApiEndpoints.getAllCategories,
    );

    final categories = response.data!;

    return categories
        .map((json) => CategoryModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<ProductModel>> getProducts([String? categorySlug]) async {
    final response = await _apiClient.get<List<dynamic>>(
      CatalogApiEndpoints.getAllProducts,
      queryParameters: {
        'category': categorySlug,
      },
    );

    final products = response.data!;

    return products
        .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
