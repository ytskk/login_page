import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'svg_asset.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({
    super.key,
    required this.achievementIcon,
    this.achievementIconSize,
    this.padding,
    required this.achievementLable,
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
          child: Column(children: [
            SvgAsset.squared(
                assetName: achievementIcon, size: achievementIconSize),
            Text(achievementLable, style: textStyle),
            if (achievementStatus != null) ...[
              const SizedBox(height: extraSmallSpacing),
              IntrinsicWidth(child: achievementStatus!),
            ],
          ])),
    );
  }
}
