import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class CountBadge extends StatelessWidget {
  const CountBadge({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: iconSize20,
      child: InfoBadge(
        backgroundColor: AppColors.middleGrey,
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
