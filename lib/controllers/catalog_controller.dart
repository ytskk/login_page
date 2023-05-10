import 'dart:developer';

import 'package:catalog_api/catalog_api.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/api/requests/get_requests_interface.dart';

class CatalogController extends GetxController {
  CatalogController({
    required CatalogApiInterface catalogApiClient,
    required BonusesApiInterface bonusesApiClient,
  })  : _catalogApiClient = catalogApiClient,
        _bonusesApiClient = bonusesApiClient;

  final CatalogApiInterface _catalogApiClient;
  final BonusesApiInterface _bonusesApiClient;

  // definitions.

  final _balance = 0.obs;
  final _products = RxList<ProductModel>([]);
  final _categories = RxList<CategoryModel>([]);
  final _selectedCategory = Rx<CategoryModel?>(null);
  final _isBalanceLoading = true.obs;
  final _isCategoriesLoading = true.obs;
  final _isProductsLoading = true.obs;

  // getters.

  int get balance => _balance.value;
  List<ProductModel> get products => _products;
  List<CategoryModel> get categories => _categories;
  CategoryModel? get selectedCategory => _selectedCategory.value;
  bool get isBalanceLoading => _isBalanceLoading.value;
  bool get isCategoriesLoading => _isCategoriesLoading.value;
  bool get isProductsLoading => _isProductsLoading.value;

  // methods.

  @override
  void onInit() {
    super.onInit();
    log(
      'CatalogController initialized',
      name: 'CatalogController::onInit',
    );

    getBalance();
    _getCategories();

    ever(
      _selectedCategory,
      _getProducts,
      condition: () => _selectedCategory.value != null,
    );
  }

  Future<void> getBalance() async {
    log('getBalance called', name: 'CatalogController::getBalance');
    final balance = await _bonusesApiClient.getBalance(userId: '1');

    // simulate network delay.
    await Future<void>.delayed(const Duration(seconds: 3));

    _balance.value = balance.totalBalance;
    _isBalanceLoading.value = false;

    update();
  }

  Future<void> _getCategories() async {
    final allCategories = await _catalogApiClient.getAllCategories();

    // simulate network delay.
    await Future<void>.delayed(const Duration(seconds: 3));

    _wrapUpWithDefaultCategory();
    _categories.addAll(allCategories);

    _isCategoriesLoading.value = false;

    _selectedCategory.value = categories.first;
    update();
  }

  void _wrapUpWithDefaultCategory() {
    const defaultCategory = CategoryModel(
      id: 'all',
      name: 'All Products',
      slug: '',
    );

    _categories.add(defaultCategory);
  }

  Future<void> _getProducts([CategoryModel? category]) async {
    log(
      'getProducts called',
      name: 'CatalogController::getProducts',
    );

    _isProductsLoading.value = true;

    final products = await _catalogApiClient.getProducts(
      category?.slug,
    );

    // simulate network delay.
    await Future<void>.delayed(const Duration(seconds: 3));

    _products.value = products;

    _isProductsLoading.value = false;

    update();
  }

  void changeSelectedCategory(CategoryModel category) {
    // change category only if it's not loading.
    if (!_isProductsLoading.value) {
      log(
        'changeSelectedCategory called',
        name: 'CatalogController::changeSelectedCategory',
      );
      _selectedCategory.value = category;
      update();
    }
  }
}

Map<String, List<ProductModel>> groupProductsByCategory(
  List<ProductModel> products,
) {
  final groupedProducts = <String, List<ProductModel>>{};

  for (final product in products) {
    if (!groupedProducts.containsKey(product.categorySlug)) {
      groupedProducts[product.categorySlug] = [];
    }

    groupedProducts[product.categorySlug]!.add(product);
  }

  return groupedProducts;
}
