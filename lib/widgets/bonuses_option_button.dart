import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class BonusesOptionButton extends StatelessWidget {
  const BonusesOptionButton({
    super.key,
    this.iconPath,
    this.onPressed,
    required this.title,
  });

  /// Path to the icon from the assets folder.
  final String? iconPath;
  final String title;
  final VoidCallback? onPressed;

  double get borderRadius => borderRadius8;

  @override
  Widget build(BuildContext context) {
    return RoundedRectangleBox(
      borderRadius: borderRadius,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashFactory: InkRipple.splashFactory,
          onTap: onPressed,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: AppColors.middleGrey,
                width: 1,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: padding24,
                vertical: padding16,
              ),
              child: Row(
                children: [
                  if (iconPath != null)
                    SvgAsset.squared(
                      assetName: iconPath!,
                      size: iconSize24,
                      color: AppColors.yellow,
                    ),
                  const SizedBox(width: spacing8),
                  Text(
                    title,
                    style: bodySTextStyle.semibold,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
