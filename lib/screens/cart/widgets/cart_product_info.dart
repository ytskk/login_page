import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class CartProductInfo extends StatelessWidget {
  const CartProductInfo({
    required this.title,
    required this.price,
    this.onRemovePressed,
    super.key,
  });

  final String title;
  final int price;
  final VoidCallback? onRemovePressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title * 2,
                style: theme.textTheme.bodyL.light,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: spacing4),
              CoinIconWithLabel(
                label: price.toString(),
                iconSize: iconSize12,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onRemovePressed,
          icon: const SvgAsset.squared(
            assetName: AppIcons.trashIcon,
          ),
        ),
      ],
    );
  }
}
