import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/screens/screens.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class ProductCardLarge extends StatelessWidget {
  const ProductCardLarge({
    required this.imageUrl,
    required this.title,
    this.description,
    this.isNew = false,
    this.button,
    this.onPressed,
    super.key,
  });

  final String imageUrl;
  final String title;
  final String? description;
  final bool isNew;
  final Widget? button;
  final VoidCallback? onPressed;

  static const double _imageSize = 140;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          ProductCardImage(
            imageUrl: imageUrl,
            width: _imageSize,
            height: _imageSize,
            innerPadding: const EdgeInsets.all(padding8),
            leading: isNew
                ? const Positioned(
                    top: spacing4,
                    left: spacing4,
                    child: NewBadge(),
                  )
                : null,
          ),
          const SizedBox(width: spacing16),
          // info
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: _imageSize,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductCardInfo(
                    title: title,
                    description: description,
                  ),
                  const SizedBox(height: spacing16),
                  if (button != null) button!,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
