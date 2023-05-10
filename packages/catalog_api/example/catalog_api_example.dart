import 'package:catalog_api/catalog_api.dart';
import 'package:dio/dio.dart';

void main(List<String> args) async {
  final api = Dio(BaseOptions(baseUrl: 'http://localhost:8080'));

  final CatalogApiInterface catalogApi = RemoteCatalogApi(dio: api);

  final categories = await catalogApi.getAllCategories();
  print(categories);

  final productsByCategory =
      await catalogApi.getProducts(categories.first.slug);

  print(productsByCategory);
}
