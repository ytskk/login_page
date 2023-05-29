import 'package:api_handler/api_handler.dart';
import 'package:bonus_api/bonus_api.dart';
import 'package:bonus_repository/bonus_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogController extends GetxController {
  CatalogController({
    required CatalogBonusRepository catalogRepository,
  }) : _catalogRepository = catalogRepository;

  final CatalogBonusRepository _catalogRepository;

  // definitions.

  final _balance = 0.obs;
  final _categories = RxList<CatalogCategoryModel>([]);
  final _products = RxList<CatalogProductModel>([]);
  final _selectedCategory = Rxn<CatalogCategoryModel>();
  final _isBalanceLoading = false.obs;
  final _isCategoriesLoading = true.obs;
  final _isProductsLoading = false.obs;
  final _error = Rxn<ApiNetworkException>();

  // getters.

  int get balance => _balance.value;
  List<CatalogCategoryModel> get categories => _categories;
  List<CatalogProductModel> get products => _products;
  CatalogCategoryModel? get selectedCategory => _selectedCategory.value;
  bool get isBalanceLoading => _isBalanceLoading.value;
  bool get isCategoriesLoading => _isCategoriesLoading.value;
  bool get isProductsLoading => _isProductsLoading.value;
  Rxn<ApiNetworkException> get error => _error;

  // setters.

  set selectedCategory(CatalogCategoryModel? value) {
    _selectedCategory.value = value;
  }

  // methods.

  @override
  void onInit() {
    super.onInit();

    _fetchCategories();
    _getProducts();

    /// Load products every time the selected category changes.
    ever(
      _selectedCategory,
      _getProducts,
    );
  }

  void handleError(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(_error.value?.message ?? 'Error')),
      );
  }

  Future<void> _fetchCategories() async {
    await performRequest(
      error: _error,
      loadingIndicator: _isCategoriesLoading,
      callback: () async {
        // load categories.
        final categories = await _catalogRepository.getCatalogCategories();

        // update categories list.
        _categories
          ..clear()
          ..addAll(categories);
      },
    );

    update();
  }

  Future<void> _getProducts([CatalogCategoryModel? category]) async {
    await performRequest(
      error: _error,
      loadingIndicator: _isProductsLoading,
      callback: () async {
        // load products.
        final products = await _catalogRepository.getCatalogProducts(
          category: category?.slug,
        );

        // update products list.
        _products
          ..clear()
          ..addAll(products);
      },
    );

    print('products: ${_products}');

    update();
  }
}

Map<T, List<E>> groupListBy<T, E>(
  List<E> list,
  T Function(E) groupBy,
) {
  final groupedProducts = <T, List<E>>{};

  for (final item in list) {
    final key = groupBy(item);

    if (!groupedProducts.containsKey(key)) {
      groupedProducts[key] = [];
    }

    groupedProducts[key]!.add(item);
  }

  return groupedProducts;
}

/// Wrap the requests, updates the loading values and errors.
Future<void> performRequest<T>({
  required Future<T> Function() callback,
  Rx<bool>? loadingIndicator,
  Rxn<ApiNetworkException>? error,
}) async {
  error?.value = null;

  try {
    loadingIndicator?.value = true;

    await callback();
  } on ApiNetworkException catch (e) {
    error?.value = e;
  } finally {
    loadingIndicator?.value = false;
  }
}
