import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';

/// {@template rounded_rectangle_box}
/// A widget that displays its [child] with a rounded rectangle border.
///
/// The [borderRadius] defaults to [largeBorderRadius].
/// The [backgroundColor] defaults to [AppColors.darkGrey].
/// The [innerPadding] defaults to [EdgeInsets.zero].
/// {@endtemplate}
class RoundedRectangleBox extends StatelessWidget {
  /// {@macro rounded_rectangle_box}
  const RoundedRectangleBox({
    super.key,
    required this.child,
    this.backgroundColor,
    this.borderRadius,
    this.innerPadding,
  });

  final Widget child;
  final Color? backgroundColor;
  final double? borderRadius;

  /// The padding to apply to the [child].
  final EdgeInsets? innerPadding;

  get _borderRadius => borderRadius ?? largeBorderRadius;
  get _innerPadding => innerPadding ?? EdgeInsets.zero;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_borderRadius),
      child: DecoratedBox(
        decoration: BoxDecoration(color: backgroundColor),
        child: Padding(
          padding: _innerPadding,
          child: child,
        ),
      ),
    );
  }
}
