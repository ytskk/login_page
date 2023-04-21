import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/rounded_rectangle_box.dart';

/// {@template info_badge}
/// A widget that displays its [child] with a rounded rectangle border.
///
/// Base wrapper for badging.
/// See also:
/// - [LabelBadge]
/// - [StatusBadge]
/// - [TagBadge]
/// {@endtemplate}
class InfoBadge extends StatelessWidget {
  // {@macro info_badge}
  const InfoBadge({
    super.key,
    required this.child,
    this.backgroundColor,
    this.contentColor,
    this.padding,
    this.borderRadius,
  });

  final Widget child;
  final Color? backgroundColor;
  final Color? contentColor;
  final EdgeInsets? padding;
  final double? borderRadius;

  Color get _contentColor => contentColor ?? AppColors.white;

  @override
  Widget build(BuildContext context) {
    final childWithDefaultTheme = DefaultTextStyle(
      style: bodySTextStyle.semibold.copyWith(
        color: _contentColor,
      ),
      child: IconTheme(
        data: IconThemeData(color: _contentColor),
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
