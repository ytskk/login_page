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
        horizontal: padding16,
        vertical: padding20,
      ),
      child: Column(
        children: [
          BlockHeader(
            title: AppStrings.achievements,
            label: achievementsCount,
          ),
          const SizedBox(height: spacing16),
          RoundedRectangleBox(
            backgroundColor: AppColors.darkGrey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AchievementCard(
                  achievementLable: 'Speaker',
                  textStyle: bodyMTextStyle,
                  achievementIcon: AppIcons.writerAchieves,
                  achievementIconSize: smallAchievementIconSize,
                  padding: padding16,
                ),
                AchievementCard(
                  achievementLable: 'Games',
                  textStyle: bodyMTextStyle,
                  achievementIcon: AppIcons.writerAchieves,
                  achievementIconSize: smallAchievementIconSize,
                  padding: padding16,
                  achievementStatus: const PointsBadge(
                    content: '300 more',
                    contentColor: AppColors.yellow,
                    backgroundColor: AppColors.middleGrey,
                    padding: EdgeInsets.symmetric(horizontal: smallPadding2),
                  ),
                ),
                AchievementCard(
                  achievementLable: 'See all',
                  textStyle: bodyMTextStyle,
                  achievementIcon: AppIcons.allAchieves,
                  achievementIconSize: smallAchievementIconSize,
                  padding: padding16,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

