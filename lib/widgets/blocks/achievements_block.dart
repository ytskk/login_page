import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/constants/generated/app_strings.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class AchievementsBlock extends StatelessWidget {
  const AchievementsBlock({
    super.key,
    this.achievementsCount,
    this.trailing,
    this.padding,
  });

  final int? achievementsCount;

  final Widget? trailing;
  
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(
        horizontal: padding16,
        vertical: padding20,
      ),
      child: Column(
        children: [
          BlockHeader(
            title: AppStrings.myAchieves.tr(),
            label: achievementsCount,
            trailing: trailing,
          ),
          const SizedBox(height: spacing16),
          RoundedRectangleBox(
            backgroundColor: appTheme.colorScheme.grey90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AchievementCard(
                  achievementLable: 'Speaker',
                  textStyle: appTheme.textTheme.bodyM,
                  achievementIcon: AppIcons.writerAchieves,
                  achievementIconSize: iconSize80,
                  padding: padding16,
                ),
                AchievementCard(
                  achievementLable: 'Games',
                  textStyle: appTheme.textTheme.bodyM,
                  achievementIcon: AppIcons.writerAchieves,
                  achievementIconSize: iconSize80,
                  padding: padding16,
                  achievementStatus: PointsBadge(
                    content: '300 more',
                    contentColor: appTheme.colorScheme.yellow,
                    backgroundColor: appTheme.colorScheme.grey50,
                    padding: const EdgeInsets.symmetric(horizontal: padding8),
                  ),
                ),
                AchievementCard(
                  achievementLable: 'See all',
                  textStyle: appTheme.textTheme.bodyM,
                  achievementIcon: AppIcons.allAchieves,
                  achievementIconSize: iconSize80,
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
