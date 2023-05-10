import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    required this.imageUrl,
    required this.title,
    required this.price,
    super.key,
  });

  final String imageUrl;
  final String title;
  final int price;

  static const double _imageSize = 64;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return RoundedRectangleBox(
      borderRadius: borderRadius16,
      backgroundColor: colorScheme.grey90,
      innerPadding: const EdgeInsets.all(padding16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          SizedBox(
            width: _imageSize,
            height: _imageSize,
            child: RoundedRectangleBox(
              backgroundColor: colorScheme.grey70,
              innerPadding: const EdgeInsets.all(padding8),
              child: RemoteImage(
                imageUrl: imageUrl,
              ),
            ),
          ),
          const SizedBox(width: spacing16),
          // product info
          CartProductInfo(
            title: title,
            price: price,
          ),
        ],
      ),
    );
  }
}

class CartProductInfo extends StatelessWidget {
  const CartProductInfo({
    required this.title,
    required this.price,
    super.key,
  });

  final String title;
  final int price;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Column(
        children: [
          // content
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.bodyL.light,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete_outline),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
