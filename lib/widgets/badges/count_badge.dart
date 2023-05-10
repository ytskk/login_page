import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class CountBadge extends StatelessWidget {
  const CountBadge({
    required this.count,
    this.border,
    this.backgroundColor,
    super.key,
  });

  final int count;
  final BoxBorder? border;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final badgeBackgroundColor =
        backgroundColor ?? Theme.of(context).colorScheme.grey50;

    return SizedBox(
      height: iconSize20,
      child: InfoBadge(
        border: border,
        backgroundColor: badgeBackgroundColor,
        padding: const EdgeInsets.symmetric(
          horizontal: spacing8,
        ),
        child: Text(
          count.toString(),
        ),
      ),
    );
  }
}
