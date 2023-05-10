import 'package:catalog_api/catalog_api.dart';
import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/screens/screens.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class GroupedProductsByCategoryList extends StatelessWidget {
  const GroupedProductsByCategoryList({
    required this.groupedProducts,
    this.onProductPressed,
    super.key,
  });

  final Map<String, List<ProductModel>> groupedProducts;
  final void Function(ProductModel product)? onProductPressed;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: groupedProducts.length,
      itemBuilder: (context, index) {
        final category = groupedProducts.keys.elementAt(index);
        final products = groupedProducts[category]!;

        return Column(
          children: [
            BlockHeader(
              title: category,
              label: products.length,
            ),
            const SizedBox(height: spacing24),
            ListView.separated(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return ProductCardLarge(
                  onPressed: () => onProductPressed?.call(product),
                  imageUrl: product.imageUrl,
                  title: product.title,
                  description: product.description,
                  isNew: product.isNew,
                  button: ProductCardButton(
                    productStatus: product.status,
                    price: product.price,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: spacing24),
            ),
          ],
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: spacing40),
    );
  }
}
