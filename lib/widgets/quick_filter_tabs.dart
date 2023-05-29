import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/app_colors.dart';

class QuickFilterTabs extends StatelessWidget {
  const QuickFilterTabs({
    required this.itemBuilder,
    required this.itemCount,
    required this.hight,
    this.padding,
    super.key,
  });

  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final double hight;
  final EdgeInsets? padding;

  EdgeInsets get _padding => padding ?? const EdgeInsets.all(padding16);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.backgroundColor;

    return ColoredBox(
      color: backgroundColor,
      child: SizedBox(
        height: hight,
        child: ListView.separated(
          padding: _padding,
          scrollDirection: Axis.horizontal,
          itemBuilder: itemBuilder,
          itemCount: itemCount,
          separatorBuilder: (_, __) => const SizedBox(width: spacing6),
        ),
      ),
    );
  }
}
