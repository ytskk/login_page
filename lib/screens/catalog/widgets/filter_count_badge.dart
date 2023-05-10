import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class FilterCountBadge extends StatelessWidget {
  const FilterCountBadge({
    required this.count,
    super.key,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RoundedRectangleBox(
      border: Border.all(
        color: theme.colorScheme.backgroundColor,
        width: 2,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
      clipBehavior: Clip.none,
      backgroundColor: theme.colorScheme.blue50,
      innerPadding: const EdgeInsets.symmetric(
        horizontal: padding8,
        vertical: padding4,
      ),
      child: Text(
        count.toString(),
        style: theme.textTheme.notice,
      ),
    );
  }
}
