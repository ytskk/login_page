import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class AchievementsBlock extends StatelessWidget {
  const AchievementsBlock({
    super.key,
    this.achievementsCount,
  });

  final int? achievementsCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: mediumPadding,
        vertical: largePadding,
      ),
      child: Column(
        children: [
          BlockHeader(
            title: AppStrings.achievements,
            label: achievementsCount,
          ),
          const SizedBox(height: mediumSpacing2),
          RoundedRectangleBox(
            innerPadding: const EdgeInsets.all(mediumPadding),
            backgroundColor: AppColors.darkGrey,
            child: Row(
              children: const [
                LabelBadge.attentionLabel(content: 'Attention'),
                LabelBadge.defaultLabel(content: 'Waiting for content'),
                LabelBadge.newLabel(content: 'New'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
