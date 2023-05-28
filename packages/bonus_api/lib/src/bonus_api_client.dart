import 'package:bonus_api/bonus_api.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'bonus_api_client.g.dart';

@RestApi()
abstract class BonusApiClient {
  factory BonusApiClient(Dio dio, {String baseUrl}) = _BonusApiClient;

  @GET(BonusApiEndpoints.getUserBalance)
  Future<UserBalanceResponseModel> getUserBalance(
    @Query('userId') String userId,
  );

  @GET(BonusApiEndpoints.getUserOperations)
  Future<UserOperationsResponseModel> getUserOperations(
    @Query('userId') String userId,
  );

  @GET(BonusApiEndpoints.getCatalogCategories)
  Future<List<CatalogCategoryModel>> getCategories();

  @GET(BonusApiEndpoints.getCatalogProducts)
  Future<List<CatalogProductModel>> getCatalogProducts({
    @Query('category') String? category,
  });
}
