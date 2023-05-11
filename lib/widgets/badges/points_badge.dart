import 'package:flutter/material.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/utils/extensions/extensions.dart';

import 'package:training_and_testing/widgets/badges/badges.dart';

class PointsBadge extends StatelessWidget {
  const PointsBadge({
    required this.content,
    this.backgroundColor,
    this.contentColor,
    this.padding,
    this.borderRadius,
    super.key,
  });

  final String content;
  final Color? backgroundColor;
  final Color? contentColor;
  final EdgeInsets? padding;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return InfoBadge(
      padding: padding,
      backgroundColor: backgroundColor,
      contentColor: contentColor,
      borderRadius: borderRadius,
      child: _buildChild(context),
    );
  }

  Widget _buildChild(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.notice.semibold.copyWith(
          color: contentColor,
        );

    final content = Text(
      this.content,
      style: textStyle,
    );
    return content;
  }
}
