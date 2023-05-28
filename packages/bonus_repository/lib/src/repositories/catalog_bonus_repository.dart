import 'package:bonus_api/bonus_api.dart';
import 'package:bonus_repository/bonus_repository.dart';

/// {@template catalog_bonus_repository}
/// Client-specific implementation of the [IBonusRepository] to perform
/// requests related only to the catalog.
/// {@endtemplate}
final class CatalogBonusRepository {
  /// {@macro catalog_bonus_repository}
  const CatalogBonusRepository({
    required IBonusRepository bonusesRepository,
  }) : _bonusesRepository = bonusesRepository;

  final IBonusRepository _bonusesRepository;

  Future<List<CatalogCategoryModel>> getCatalogCategories() async {
    return _bonusesRepository.getCatalogCategories();
  }

  Future<List<CatalogProductModel>> getCatalogProducts({
    String? category,
  }) async {
    return _bonusesRepository.getCatalogProducts(category: category);
  }
}
