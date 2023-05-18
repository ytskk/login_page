import 'package:flutter/material.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class GestureIcon extends StatelessWidget {
  const GestureIcon({
    required this.icon,
    this.onTap,
    super.key,
  });

  factory GestureIcon.fromAssetName({
    required String assetName,
    Color? color,
    VoidCallback? onTap,
    double? size,
  }) = _GestureIconFromAssetName;

  final Widget icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: icon,
    );
  }
}

class _GestureIconFromAssetName extends GestureIcon {
  _GestureIconFromAssetName({
    required String assetName,
    double? size,
    Color? color,
    super.onTap,
  }) : super(
          icon: SvgAsset.squared(
            assetName: assetName,
            size: size,
            color: color,
          ),
        );
}
