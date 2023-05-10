import 'package:flutter/material.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/utils/extensions/extensions.dart';

import 'package:training_and_testing/widgets/badges/badges.dart';

class PointsBadge extends StatelessWidget {
  PointsBadge({
    required this.content,
    super.key,
    this.backgroundColor,
    this.contentColor,
    this.padding,
    this.borderRadius,
  });

  final String content;
  final Color? backgroundColor;
  final Color? contentColor;
  final EdgeInsets? padding;
  final double? borderRadius;

  late ThemeData _appTheme;

  @override
  Widget build(BuildContext context) {
    _appTheme = Theme.of(context);
    return InfoBadge(
      padding: padding,
      backgroundColor: backgroundColor,
      contentColor: contentColor,
      borderRadius: borderRadius,
      child: _buildChild(),
    );
  }

  Widget _buildChild() {
    final content = Text(
      this.content,
      style: _appTheme.textTheme.notice.semibold.copyWith(
        color: contentColor,
      ),
    );
    return content;
  }
}
