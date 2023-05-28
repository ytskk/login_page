import 'package:bonus_api/bonus_api.dart';

abstract interface class IBonusRepository {
  Future<UserBalanceModel> getUserBalance({
    required String userId,
  });

  Future<UserOperationsResponseModel> getUserOperations({
    required String userId,
  });

  Future<List<CatalogCategoryModel>> getCatalogCategories();

  Future<List<CatalogProductModel>> getCatalogProducts({
    String? category,
  });
}
