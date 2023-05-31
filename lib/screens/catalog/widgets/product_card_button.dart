import 'package:bonus_api/bonus_api.dart';
import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class ProductCardButton extends StatelessWidget {
  const ProductCardButton({
    this.productStatus = CatalogProductStatus.available,
    super.key,
    this.price,
    this.onAddToCartPressed,
  });

  final CatalogProductStatus productStatus;
  final int? price;
  final VoidCallback? onAddToCartPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (productStatus == CatalogProductStatus.available) {
      return RoundedRectangleBox(
        backgroundColor: colorScheme.grey90,
        borderRadius: 100,
        child: Row(
          children: [
            const SizedBox(width: spacing12),
            CoinIconWithLabel(label: price!.toString()),
            const SizedBox(width: spacing16),
            Expanded(
              child: BrandButton(
                onPressed: onAddToCartPressed,
                child: SvgAsset.squared(
                  assetName: AppIcons.basketIcon,
                  color: colorScheme.onBackground,
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (productStatus == CatalogProductStatus.addedToCart) {
      return Row(
        children: [
          Expanded(
            child: BrandButton(
              onPressed: () {},
              type: ButtonType.secondary,
              child: const Text('Place order'),
            ),
          ),
        ],
      );
    }

    return const Row(
      children: [
        Expanded(
          child: BrandButton(
            type: ButtonType.secondary,
            child: Text('Soon'),
          ),
        ),
      ],
    );
  }
}
