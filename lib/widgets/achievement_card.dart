import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'svg_asset.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({
    super.key,
    required this.achievementIcon,
    this.achievementIconSize,
    this.padding,
    required this.achievementName,
    this.achievementStatus,
  });

  final String achievementIcon;
  final double? achievementIconSize;
  final Text achievementName;
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
                  assetName: achievementIcon, size: achievementIconSize),
              achievementName,
              if (achievementStatus != null) ...[
                const SizedBox(height: extraSmallSpacing),
                // [Row] is used to limit the size of [Column]
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: achievementStatus!),
                  ],
                )
              ],
            ])),
    );
  }
}
