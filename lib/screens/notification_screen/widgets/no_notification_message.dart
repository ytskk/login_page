
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class NoNotificationMessageWidget extends StatelessWidget {
  const NoNotificationMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SvgAsset.squared(
                assetName: AppIcons.noNotificationBell,
                size: iconSize64,
              ),
              const SizedBox(height: padding12),
              Text(
                AppStrings.youHave.tr().toUpperCase(),
                style: Theme.of(context).textTheme.hero,
              ),
              Text(
                AppStrings.noMessages.tr().toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .hero
                    .copyWith(color: Theme.of(context).colorScheme.blue50),
              ),
            ],
          ),
        ),
        ListView(),
      ],
    );
  }
}