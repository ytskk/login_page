import 'package:flutter/material.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/rounded_rectangle_box.dart';

/// {@template info_badge}
/// A widget that displays its [child] with a rounded rectangle border.
///
/// Base wrapper for badging.
/// See also:
/// - LabelBadge
/// - StatusBadge
/// - TagBadge
/// {@endtemplate}
class InfoBadge extends StatelessWidget {
  // {@macro info_badge}
  const InfoBadge({
    required this.child,
    this.backgroundColor,
    this.contentColor,
    this.padding,
    this.borderRadius,
    super.key,
  });

  final Widget child;
  final Color? backgroundColor;
  final Color? contentColor;
  final EdgeInsets? padding;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final childWithDefaultTheme = DefaultTextStyle(
      style: appTheme.textTheme.bodyS.semibold.copyWith(
        color: contentColor ?? appTheme.colorScheme.white,
      ),
      child: IconTheme(
        data: IconThemeData(color: contentColor ?? appTheme.colorScheme.white),
        child: Center(
          child: child,
        ),
      ),
    );

    return RoundedRectangleBox(
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      innerPadding: padding,
      child: childWithDefaultTheme,
    );
  }
}
