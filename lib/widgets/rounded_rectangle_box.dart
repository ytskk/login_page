import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';

/// {@template rounded_rectangle_box}
/// A widget that displays its [child] with a rounded rectangle border.
///
/// The [borderRadius] defaults to [largeBorderRadius].
/// The [backgroundColor] defaults to [AppColors.darkGrey].
/// {@endtemplate}
class RoundedRectangleBox extends StatelessWidget {
  /// {@macro rounded_rectangle_box}
  const RoundedRectangleBox({
    super.key,
    required this.child,
    this.backgroundColor,
    this.borderRadius,
  });

  final Widget child;
  final Color? backgroundColor;
  final double? borderRadius;

  get _borderRadius => borderRadius ?? largeBorderRadius;
  get _backgroundColor => backgroundColor ?? AppColors.darkGrey;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_borderRadius),
      child: DecoratedBox(
        // color: _backgroundColor,
        decoration: BoxDecoration(color: backgroundColor),
        child: child,
      ),
    );
  }
}
