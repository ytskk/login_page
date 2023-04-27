import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class CountBadge extends StatelessWidget {
  const CountBadge({
    required this.count,
    super.key,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: iconSize20,
      child: InfoBadge(
        backgroundColor: Theme.of(context).colorScheme.grey50,
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
