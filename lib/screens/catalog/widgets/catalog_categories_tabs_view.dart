import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/screens/screens.dart';

class CatalogCategoriesTabsView extends StatelessWidget {
  const CatalogCategoriesTabsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<CatalogController>(
      builder: (controller) {
        print('updating categories tabs');
        // to make GetX reactive to changes in selectedCategory
        final selectedCategory = controller.selectedCategory.value;
        final isCategoryLoading = controller.isCategoriesLoading;

        return FutureBuilder(
          future: controller.categoriesFuture.value,
          builder: (_, snapshot) {
            final isLoading =
                snapshot.connectionState != ConnectionState.done &&
                    snapshot.connectionState != ConnectionState.none;

            if (snapshot.hasError && !isLoading) {
              return const SizedBox.shrink();
            }

            return CategoriesTabs(
              isLoading: isLoading,
              categories: snapshot.data,
              selectedCategory: selectedCategory,
              onCategorySelected: isLoading ? null : controller.loadProducts,
            );
          },
        );
      },
    );
  }
}
