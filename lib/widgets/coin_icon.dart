import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class CoinIcon extends StatelessWidget {
  const CoinIcon({
    super.key,
    this.size = mediumIconSize,
    this.color = AppColors.white,
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgAsset.squared(
      assetName: AppIcons.coinIcon,
      size: size,
      color: color,
    );
  }
}
