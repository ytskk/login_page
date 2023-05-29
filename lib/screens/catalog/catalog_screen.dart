import 'dart:async';
import 'dart:developer';

import 'package:catalog_api/catalog_api.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/api/config.dart';
import 'package:training_and_testing/api/requests/get_requests.dart';
import 'package:training_and_testing/api/services/dio_client.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/screens/screens.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      // TODO: universal api wrapper and api client DI
      init: CatalogController(
        catalogApiClient: RemoteCatalogApi(
          dio: Dio(
            BaseOptions(
              // android base url
              // baseUrl: 'http://10.0.2.2:8080/',
              // ios base url
              baseUrl: 'http://185.232.169.195',
            ),
          ),
        ),
        bonusesApiClient: GetRequests(
          dioClient: DioClient.client(
            baseUrl: BonusesApiConfig.baseUrl,
            debug: true,
          ),
        ),
      ),
      builder: (controller) => GetListener<CatalogController>(
        reactive: controller.error,
        listenWhen: (controller) => controller.error.value != null,
        listener: (context, controller) {
          if (controller.error.value != null) {
            controller.handleError(context);
          }
        },
        child: const CatalogScreenView(),
      ),
    );
  }
}

class CatalogScreenView extends StatelessWidget {
  const CatalogScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CatalogController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: CustomScrollView(
              slivers: [
                CatalogAppBar(
                  isLoading: controller.isBalanceLoading,
                  balance: controller.balance,
                ),

                // categories + products
                SliverStickyHeader(
                  header: CategoriesTabs(
                    categories: controller.categories,
                    isLoading: controller.isCategoriesLoading,
                    selectedCategory: controller.selectedCategory,
                    onCategorySelected: (category) =>
                        controller.changeSelectedCategory(category),
                  ),
                  sliver: ShimmerSwitchWidget(
                    isShimmerActive: controller.isProductsLoading,
                    shimmer: const ShimmerLoadingSliverList(
                      item: CatalogProductCardShimmer(),
                      itemCount: 4,
                    ),
                    child: SliverGroupedList(
                      items: groupListBy(
                        controller.products,
                        (product) => product.categoryName,
                      ),
                      groupHeaderBuilder: _buildGroupHeader,
                      itemBuilder: _buildProductCardLarge,
                      separator: const SizedBox(height: spacing24),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: spacing80),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGroupHeader(
    String categoryName,
    int count,
  ) =>
      BlockHeader(
        padding: const EdgeInsets.only(
          top: spacing40,
          bottom: spacing24,
        ),
        title: categoryName,
        label: count,
      );

  Widget _buildProductCardLarge(
    BuildContext context,
    ProductModel product,
    int index,
  ) =>
      ProductCardLarge(
        onPressed: () {
          showProductInfoModalSheet(
            context: context,
            product: product,
            footer: Row(
              children: [
                Expanded(
                  child: BrandButton(
                    size: ButtonSize.large,
                    onPressed: () async {
                      final wasAdded =
                          await _onAddToCartPressed(context, product);
                      print('wasAdded: $wasAdded');

                      if (wasAdded) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Add to cart'),
                  ),
                ),
              ],
            ),
          );
        },
        imageUrl: product.imageUrl,
        title: product.title,
        description: product.description,
        isNew: product.isNew,
        button: ProductCardButton(
          productStatus: product.status,
          price: product.price,
          onAddToCartPressed: () async {
            await _onAddToCartPressed(context, product);
          },
        ),
      );

  /// Returns true if product can be successfully added to cart. Useful to
  /// close modal sheet after product was added.
  Future<bool> _onAddToCartPressed(
    BuildContext context,
    ProductModel product,
  ) async {
    final option = await _selectOption(
      context,
      product.options,
    );

    // If product has options and user didn't select any, don't add it to cart.
    if (product.options != null && option == null) {
      return false;
    }

    // TODO: implement add to cart logic.
    log('Product: $product${product.options != null ? ' with option: $option' : ''} was added to cart.');

    return true;
  }

  /// Returns selected option or null if user didn't select any. Or null if
  /// product doesn't have any options.
  Future<String?> _selectOption(
    BuildContext context,
    List<String>? options,
  ) async {
    if (options == null) {
      return null;
    }

    final option = await _showSelectOptionModalSheet(
      context,
      options,
    );

    return option;
  }

  Future<String?> _showSelectOptionModalSheet(
    BuildContext context,
    List<String> options,
  ) async {
    return showCustomModalBottomSheet<String?>(
      context: context,
      trailing: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(tr(AppStrings.close)),
      ),
      title: Text(tr(AppStrings.size)),
      child: Column(
        children: [
          ...options.map(
            (option) => MenuItem(
              title: option,
              onPressed: () {
                Navigator.of(context).pop(option);
              },
            ),
          ),
        ],
      ),
    );
  }
}
