import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/coin_icon.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class LabelBadge extends StatelessWidget {
  LabelBadge.custom({
    super.key,
    this.icon,
    required this.content,
    this.borderRadius,
    this.backgroundColor,
    this.contentColor,
    this.padding,
  });

  factory LabelBadge.defaultLabel({
    required String content,
    required BuildContext context,
  }) = _LabelBadgeDefault;

  factory LabelBadge.attentionLabel({
    required String content,
    required BuildContext context,
  }) = _LabelBadgeAttention;

  factory LabelBadge.newLabel({
    required String content,
    required BuildContext context,
  }) = _LabelBadgeNew;

  final Widget? icon;
  final String content;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? contentColor;
  final EdgeInsets? padding;

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
      style: _appTheme.textTheme.bodyS.semibold.copyWith(
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
}

class _LabelBadgeDefault extends LabelBadge {
  _LabelBadgeDefault({
    required super.content,
    required context,
  }) : super.custom(
          backgroundColor: Theme.of(context).colorScheme.blue50,
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
  _LabelBadgeAttention({
    required super.content,
    required context,
  }) : super.custom(
          backgroundColor: Theme.of(context).colorScheme.red,
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
  _LabelBadgeNew({
    required super.content,
    required context,
  }) : super.custom(
          backgroundColor: Theme.of(context).colorScheme.yellow,
          contentColor: Theme.of(context).colorScheme.grey90,
          borderRadius: borderRadius4,
          padding: const EdgeInsets.symmetric(
            horizontal: padding4,
          ),
        );
}
