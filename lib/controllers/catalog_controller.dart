import 'dart:developer';

import 'package:api_handler/api_handler.dart';
import 'package:catalog_api/catalog_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  final _isProductsLoading = false.obs;
  final _error = Rxn<ApiNetworkException>();

  // getters.

  int get balance => _balance.value;

  List<ProductModel> get products => _products;

  List<CategoryModel> get categories => _categories;

  CategoryModel? get selectedCategory => _selectedCategory.value;

  bool get isBalanceLoading => _isBalanceLoading.value;

  bool get isCategoriesLoading => _isCategoriesLoading.value;

  bool get isProductsLoading => _isProductsLoading.value;

  Rxn<ApiNetworkException> get error => _error;

  bool get hasError => _error.value != null;

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

    /// Load products every time the selected category changes and its value is
    /// not null.
    ever(
      _selectedCategory,
      _getProducts,
      condition: () => _selectedCategory.value != null,
    );
  }

  void handleError(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(_error.value?.message ?? 'Error')),
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
    await performRequest(
      callback: fetchCategories,
      loadingIndicator: _isCategoriesLoading,
      error: _error,
    );

    update();
  }

  Future<void> fetchCategories() async {
    final allCategories = await _catalogApiClient.getAllCategories();

    _wrapUpWithDefaultCategory();
    _categories.addAll(allCategories);

    _selectedCategory.value = categories.first;

    // throw DioError(
    //   requestOptions: RequestOptions(path: 'path'),
    //   type: DioErrorType.badCertificate,
    //   message: 'Check your internet connection.',
    // );
  }

  void _wrapUpWithDefaultCategory() {
    // TODO: add typography support and use it here.
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

    try {
      // simulate network delay.
      await Future<void>.delayed(const Duration(seconds: 3));

      final products = await ApiHandler.get(
        () => _catalogApiClient.getProducts(
          category?.slug,
        ),
      );

      _products.value = products;
    } on ApiNetworkException catch (e) {
      _error.value = e;
      log('Error: $e', name: 'CatalogController::getProducts');
    } finally {
      _isProductsLoading.value = false;
    }

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

    await ApiHandler.get(callback);
  } on ApiNetworkException catch (e) {
    error?.value = e;
  } finally {
    loadingIndicator?.value = false;
  }
}
