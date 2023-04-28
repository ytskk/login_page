import 'package:flutter/material.dart';

import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/widgets/svg_asset.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({
    required this.achievementIcon,
    required this.achievementLable,
    super.key,
    this.achievementIconSize,
    this.padding,
    this.textStyle,
    this.achievementStatus,
  });

  final String achievementIcon;
  final double? achievementIconSize;
  final String achievementLable;
  final TextStyle? textStyle;
  final Widget? achievementStatus;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.all(padding ?? .0),
        child: Column(
          children: [
            SvgAsset.squared(
              assetName: achievementIcon,
              size: achievementIconSize,
            ),
            Text(achievementLable, style: textStyle),
            if (achievementStatus != null) ...[
              const SizedBox(height: spacing2),
              IntrinsicWidth(child: achievementStatus),
            ],
          ],
        ),
      ),
    );
  }
}
