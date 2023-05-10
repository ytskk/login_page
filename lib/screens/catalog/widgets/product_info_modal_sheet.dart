import 'package:catalog_api/catalog_api.dart';
import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class ProductInfoModalSheet extends StatelessWidget {
  const ProductInfoModalSheet({
    required this.product,
    this.onAddToCartPressed,
    super.key,
  });

  final ProductModel product;
  final VoidCallback? onAddToCartPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: spacing16),
          Expanded(
            child: RemoteImage(
              imageUrl: product.imageUrl,
            ),
          ),
          const SizedBox(height: spacing16),
          Column(
            children: [
              Text(
                product.title,
                style: textTheme.h2.medium,
              ),
              if (product.price != null) ...[
                const SizedBox(height: spacing8),
                CoinIconWithLabel(
                  label: product.price.toString(),
                  textStyle: textTheme.h2.medium,
                ),
              ],
              if (product.description != null) ...[
                const SizedBox(height: spacing16),
                Text(
                  product.description!,
                  style: textTheme.bodyM.light,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
          // TODO: translate this
          if (product.status != ProductStatus.soon)
            BrandButton(
              onPressed: onAddToCartPressed,
              child: const Text('Add to cart'),
            ),
          const SizedBox(height: spacing44),
        ],
      ),
    );
  }
}
