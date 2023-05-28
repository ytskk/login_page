import 'package:bonus_api/bonus_api.dart';
import 'package:dio/dio.dart';

void main(List<String> args) async {
  final baseUrl = 'http://localhost:8080/';

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
    ),
  );

  final bonusApiClient = BonusApiClient(dio);

  final response = await bonusApiClient.getCatalogProducts();

  print(response);

  for (final product in response) {
    print(product.toJson());
  }
}
