import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class CoinIcon extends StatelessWidget {
  const CoinIcon({
    super.key,
    this.size = iconSize20,
    this.color,
  });

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgAsset.squared(
      assetName: AppIcons.coinIcon,
      size: size,
      color: color ?? Theme.of(context).colorScheme.white,
    );
  }
}
