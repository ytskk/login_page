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
            backgroundColor: AppColors.darkGrey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AchievementCard(
                  achievementIcon: AppIcons.writerAchieves,
                  achievementIconSize: smallAchievementIconSize,
                  achievementName: Text(
                    'Speaker',
                    style: bodyMTextStyle,
                  ),
                  padding: mediumPadding,
                ),
                AchievementCard(
                  achievementIcon: AppIcons.writerAchieves,
                  achievementIconSize: smallAchievementIconSize,
                  achievementName: Text(
                    'Writer',
                    style: bodyMTextStyle,
                  ),
                  padding: mediumPadding,
                  achievementStatus: const PointsBadge(
                    content: '300 more',
                    contentColor: AppColors.yellow,
                    backgroundColor: AppColors.middleGrey,
                    padding: EdgeInsets.symmetric(horizontal: smallPadding2),
                  ),
                ),
                AchievementCard(
                  achievementIcon: AppIcons.allAchieves,
                  achievementIconSize: smallAchievementIconSize,
                  achievementName: Text(
                    'See all',
                    style: bodyMTextStyle,
                  ),
                  padding: mediumPadding,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

