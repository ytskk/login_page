import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/app_colors.dart';

class QuickFilterTabs extends StatelessWidget {
  const QuickFilterTabs({
    required this.itemBuilder,
    required this.itemCount,
    super.key,
  });

  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.backgroundColor;

    return ColoredBox(
      color: backgroundColor,
      child: SizedBox(
        height: 72,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: spacing16,
            vertical: spacing16,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: itemBuilder,
          itemCount: itemCount,
          separatorBuilder: (_, __) => const SizedBox(width: spacing6),
        ),
      ),
    );
  }
}
