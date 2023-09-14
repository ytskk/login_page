import 'package:api_handler/api_handler.dart';
import 'package:bonus_api/bonus_api.dart';
import 'package:bonus_repository/bonus_repository.dart';

class NetworkBonusRepository implements IBonusRepository {
  const NetworkBonusRepository({
    required BonusApiClient bonusApi,
  }) : _bonusApi = bonusApi;

  final BonusApiClient _bonusApi;

  @override
  Future<List<CatalogCategoryModel>> getCatalogCategories() async {
    return ApiHandler.get(_bonusApi.getCategories);
  }

  /// Returns a list of products from the catalog by [category], if [category]
  /// is null, returns all products.
  ///
  /// Throws [ApiNetworkException] if any error occurs while fetching data.
  @override
  Future<List<CatalogProductModel>> getCatalogProducts({
    String? category,
  }) async {
    return ApiHandler.get(
      () => _bonusApi.getCatalogProducts(category: category),
    );
  }

  @override
  Future<UserBalanceModel> getUserBalance({
    required String userId,
  }) async {
    return ApiHandler.get(
      () => _bonusApi.getUserBalance(userId),
    );
  }

  @override
  Future<UserOperationsResponseModel> getUserOperations({
    required String userId,
  }) async {
    return ApiHandler.get(
      () => _bonusApi.getUserOperations(userId),
    );
  }
}
