import 'package:api_handler/api_handler.dart';
import 'package:bonus_api/bonus_api.dart';
import 'package:bonus_repository/bonus_repository.dart';
import 'package:cache_client/cache_client.dart';

final class NetworkCacheableBonusRepository implements IBonusRepository {
  const NetworkCacheableBonusRepository({
    required BonusApiClient bonusApi,
    required ICacheClient cacheClient,
  })  : _bonusApi = bonusApi,
        _cacheClient = cacheClient;

  final BonusApiClient _bonusApi;
  final ICacheClient _cacheClient;

  @override
  Future<List<CatalogCategoryModel>> getCatalogCategories() async =>
      ApiHandler.get(_bonusApi.getCategories);

  @override
  Future<List<CatalogProductModel>> getCatalogProducts({
    String? category,
  }) async {
    final cacheKey = 'catalog_products_$category';

    final cachedProducts =
        await _cacheClient.read<List<CatalogProductModel>>(key: cacheKey);

    if (cachedProducts != null) {
      print('returning cached products');
      return cachedProducts;
    }

    final products = await ApiHandler.get(
      () => _bonusApi.getCatalogProducts(category: category),
    );

    print('cached products are expired, updating cache');

    await _cacheClient.write(
      key: cacheKey,
      value: CacheEntity.dated(
        products,
        cacheDuration: const Duration(minutes: 5),
      ),
    );

    return products;
  }

  @override
  Future<UserBalanceModel> getUserBalance({required String userId}) {
    // TODO: implement getUserBalance
    throw UnimplementedError();
  }

  @override
  Future<UserOperationsResponseModel> getUserOperations(
      {required String userId}) {
    // TODO: implement getUserOperations
    throw UnimplementedError();
  }
}
