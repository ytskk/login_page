import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/coin_icon.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class LabelBadge extends StatelessWidget {
  const LabelBadge.custom({
    super.key,
    this.icon,
    required this.content,
    this.borderRadius,
    this.backgroundColor,
    this.contentColor,
    this.padding,
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

  final Widget? icon;
  final String content;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? contentColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
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
      style: bodySTextStyle.semibold.copyWith(
        color: contentColor,
      ),
    );
    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          content,
          const SizedBox(width: extraSmallSpacing),
          icon!,
        ],
      );
    } else {
      return content;
    }
  }
}

class _LabelBadgeDefault extends LabelBadge {
  const _LabelBadgeDefault({
    required super.content,
  }) : super.custom(
          backgroundColor: AppColors.blueMain,
          icon: const CoinIcon(
            size: smallIconSize2,
          ),
          padding: const EdgeInsets.only(
            left: smallPadding2,
            right: smallPadding1,
          ),
        );
}

class _LabelBadgeAttention extends LabelBadge {
  const _LabelBadgeAttention({
    required super.content,
  }) : super.custom(
          backgroundColor: AppColors.red,
          icon: const CoinIcon(
            size: smallIconSize2,
          ),
          padding: const EdgeInsets.only(
            left: smallPadding2,
            right: smallPadding1,
          ),
        );
}

class _LabelBadgeNew extends LabelBadge {
  const _LabelBadgeNew({
    required super.content,
  }) : super.custom(
          backgroundColor: AppColors.yellow,
          contentColor: AppColors.darkGrey,
          borderRadius: smallBorderRadius,
          padding: const EdgeInsets.symmetric(
            horizontal: smallPadding1,
          ),
        );
}
