import 'package:catalog_api/catalog_api.dart';
import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/screens/screens.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class CategoriesTabs extends StatelessWidget {
  const CategoriesTabs({
    required this.isLoading,
    required this.categories,
    this.selectedCategory,
    this.onCategorySelected,
    super.key,
  });

  final bool isLoading;
  final List<CategoryModel> categories;
  final CategoryModel? selectedCategory;
  final void Function(CategoryModel category)? onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return ShimmerSwitchWidget(
      isShimmerActive: isLoading,
      shimmer: ShimmerLoadingList(
        scrollDirection: Axis.horizontal,
        height: 32,
        gap: spacing16,
        item: const Shimmer(
          borderRadius: borderRadius24,
          width: 72,
        ),
      ),
      child: QuickFilterTabs(
        itemCount: categories.length,
        itemBuilder: (_, index) {
          final category = categories[index];

          return TagBadge(
            onPressed: () => onCategorySelected?.call(category),
            isSelected: category.id == selectedCategory?.id,
            child: Text(category.name),
          );
        },
      ),
    );
  }
}
