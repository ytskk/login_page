import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/app_colors.dart';

class RoundedRectangleBox extends StatelessWidget {
  const RoundedRectangleBox({
    super.key,
    required this.child,
    this.backgroundColor,
    this.borderRadius,
  });

  final Widget child;
  final Color? backgroundColor;
  final double? borderRadius;

  get _borderRadius => borderRadius ?? 16;
  get _backgroundColor => backgroundColor ?? AppColors.darkGrey;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_borderRadius),
      child: ColoredBox(
        color: _backgroundColor,
        child: child,
      ),
    );
  }
}
