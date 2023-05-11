import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

/// {@template coin_icon_with_label}
/// Widget that displays [CoinIcon] preceded by [label].
/// {@endtemplate}
class CoinIconWithLabel extends StatelessWidget {
  /// {@macro coin_icon_with_label}
  const CoinIconWithLabel({
    required this.label,
    this.iconSize,
    this.textStyle,
    this.gap = spacing4,
    super.key,
  });

  final String label;
  final double gap;
  final TextStyle? textStyle;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final color = theme.colorScheme.yellow;
    final resolvedTextStyle = textStyle ?? theme.textTheme.bodyM.semibold;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: resolvedTextStyle.copyWith(color: color),
        ),
        SizedBox(width: gap),
        CoinIcon(
          color: color,
          size: iconSize,
        ),
      ],
    );
  }
}
