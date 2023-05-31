import 'package:bonus_api/bonus_api.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/screens/screens.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class CatalogProductsListView extends StatelessWidget {
  const CatalogProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<CatalogController>(
      builder: (controller) {
        print('updating products list');

        return FutureBuilder(
          future: controller.productsFuture.value,
          builder: (_, snapshot) {
            final isLoading =
                snapshot.connectionState != ConnectionState.done &&
                    snapshot.connectionState != ConnectionState.none;

            if (snapshot.hasError && !isLoading) {
              return SliverToBoxAdapter(
                child: SizedBox(
                  child: Text('Error: ${snapshot.error}'),
                ),
              );
            }

            return ShimmerSwitchWidget(
              isShimmerActive: isLoading,
              shimmer: const ShimmerLoadingSliverList(
                item: CatalogProductCardShimmer(),
                itemCount: 4,
              ),
              child: SliverGroupedList(
                items: groupListBy(
                  snapshot.data ?? <CatalogProductModel>[],
                  (product) => product.category,
                ),
                groupHeaderBuilder: _buildGroupHeader,
                itemBuilder: _buildProductCardLarge,
                separator: const SizedBox(height: spacing24),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildGroupHeader(
    CatalogCategoryModel category,
    int count,
  ) =>
      BlockHeader(
        padding: const EdgeInsets.only(
          top: spacing40,
          bottom: spacing24,
        ),
        title: category.name,
        label: count,
      );

  Widget _buildProductCardLarge(
    BuildContext context,
    CatalogProductModel product,
    int index,
  ) =>
      CatalogProductCard(
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
                      await _onAddToCartPressed(context, product);
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
    CatalogProductModel product,
  ) async {
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
