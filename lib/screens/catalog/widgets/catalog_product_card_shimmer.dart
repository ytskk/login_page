import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/widgets/widgets.dart';

/// {@template catalog_product_card_shimmer}
/// Shows shimmer effect for product card.
/// {@endtemplate}
class CatalogProductCardShimmer extends StatelessWidget {
  /// {@macro catalog_product_card_shimmer}
  const CatalogProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer(
          borderRadius: borderRadius8,
          width: 140,
          height: 140,
        ),
        SizedBox(width: spacing16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Shimmer(
                height: spacing24,
                width: double.infinity,
                borderRadius: borderRadius8,
              ),
              SizedBox(height: spacing16),
              Shimmer(
                height: spacing32,
                width: double.infinity,
                borderRadius: borderRadius8,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
