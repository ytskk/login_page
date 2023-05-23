import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/screens/screens.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.quantity,
    this.onRemovePressed,
    this.selectedOption,
    this.onQuantityChanged,
    this.onOptionChanged,
    this.onCardPressed,
    super.key,
  });

  final String imageUrl;
  final String title;
  final int price;
  final VoidCallback? onRemovePressed;
  final VoidCallback? onCardPressed;
  final int quantity;
  final String? selectedOption;
  final VoidCallback? onQuantityChanged;
  final VoidCallback? onOptionChanged;

  static const double _imageSize = 64;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onCardPressed,
      child: RoundedRectangleBox(
        borderRadius: borderRadius16,
        backgroundColor: colorScheme.grey90,
        innerPadding: const EdgeInsets.all(padding16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            ProductCardImage(
              innerPadding: const EdgeInsets.all(padding8),
              imageUrl: imageUrl,
              height: _imageSize,
              width: _imageSize,
            ),

            const SizedBox(width: spacing16),
            // product info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CartProductInfo(
                    title: title,
                    price: price,
                    onRemovePressed: onRemovePressed,
                  ),
                  Wrap(
                    spacing: spacing8,
                    runSpacing: spacing8,
                    children: [
                      CounterPill(
                        onPressed: () {},
                        label: 'QTY:',
                        value: quantity.toString(),
                      ),
                      if (selectedOption != null)
                        CounterPill(
                          onPressed: () {},
                          label: 'SIZE:',
                          value: selectedOption.toString(),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterPill extends StatelessWidget {
  const CounterPill({
    required this.label,
    required this.value,
    this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BrandButton.icon(
      onPressed: onPressed,
      padding: const EdgeInsets.fromLTRB(
        padding16,
        padding4,
        padding8,
        padding4,
      ),
      iconPosition: IconPosition.right,
      gap: spacing8,
      icon: const Icon(
        Icons.add,
        size: iconSize16,
      ),
      child: Row(
        children: [
          Text(
            label,
            style: theme.textTheme.buttonS.semibold.copyWith(
              color: theme.colorScheme.backgroundInverse.withOpacity(0.4),
            ),
          ),
          const SizedBox(width: spacing2),
          Text(
            value,
            style: theme.textTheme.buttonS.semibold,
          ),
        ],
      ),
    );
  }
}
