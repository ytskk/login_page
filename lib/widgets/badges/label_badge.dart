import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class LabelBadge extends StatelessWidget {
  const LabelBadge.custom({
    required this.content,
    this.icon,
    this.borderRadius,
    this.backgroundColor,
    this.contentColor,
    this.padding,
    this.type = LabelBadgeType.custom,
    super.key,
  });

  const factory LabelBadge.defaultLabel({
    required String content,
  }) = _LabelBadgeDefault;

  const factory LabelBadge.attentionLabel({
    required String content,
  }) = _LabelBadgeAttention;

  const factory LabelBadge.newLabel({
    required String content,
  }) = _LabelBadgeNew;

  factory LabelBadge.typeLabel({
    required String content,
    required BuildContext context,
  }) = _LabelBadgeType;

  factory LabelBadge.typeLabel({
    required String content,
    required BuildContext context,
  }) = _LabelBadgeType;

  final Widget? icon;
  final String content;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? contentColor;
  final EdgeInsets? padding;
  final LabelBadgeType type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final _backgroundColor = backgroundColor ??
        _getBackgroundColorFromType(
          theme.colorScheme,
          type,
        );

    final _contentColor = contentColor ??
        _getContentColorFromType(
          theme.colorScheme,
          type,
        );

    return InfoBadge(
      padding: padding,
      backgroundColor: _backgroundColor,
      contentColor: _contentColor,
      borderRadius: borderRadius,
      child: _buildChild(theme),
    );
  }

  Widget _buildChild(ThemeData theme) {
    final content = Text(
      this.content,
      style: theme.textTheme.bodyS.semibold.copyWith(
        color: contentColor,
      ),
    );
    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          content,
          const SizedBox(width: spacing2),
          icon!,
        ],
      );
    } else {
      return content;
    }
  }

  Color? _getBackgroundColorFromType(
    ColorScheme colorScheme,
    LabelBadgeType type,
  ) {
    switch (type) {
      case LabelBadgeType.defaultLabel:
        return colorScheme.blue50;
      case LabelBadgeType.attentionLabel:
        return colorScheme.red;
      case LabelBadgeType.newLabel:
        return colorScheme.yellow;
      case LabelBadgeType.custom:
        return null;
    }
  }

  Color? _getContentColorFromType(
    ColorScheme colorScheme,
    LabelBadgeType type,
  ) {
    if (type == LabelBadgeType.newLabel) {
      return colorScheme.black;
    }

    return null;
  }
}

class _LabelBadgeDefault extends LabelBadge {
  const _LabelBadgeDefault({
    required super.content,
  }) : super.custom(
          type: LabelBadgeType.defaultLabel,
          icon: const CoinIcon(
            size: iconSize12,
          ),
          padding: const EdgeInsets.only(
            left: padding8,
            right: padding4,
          ),
        );
}

class _LabelBadgeAttention extends LabelBadge {
  const _LabelBadgeAttention({
    required super.content,
  }) : super.custom(
          type: LabelBadgeType.attentionLabel,
          icon: const CoinIcon(
            size: iconSize12,
          ),
          padding: const EdgeInsets.only(
            left: padding8,
            right: padding4,
          ),
        );
}

class _LabelBadgeNew extends LabelBadge {
  const _LabelBadgeNew({
    required super.content,
  }) : super.custom(
          type: LabelBadgeType.newLabel,
          borderRadius: borderRadius4,
          padding: const EdgeInsets.symmetric(
            horizontal: padding4,
          ),
        );
}

enum LabelBadgeType {
  defaultLabel,
  attentionLabel,
  newLabel,
  custom,
}
