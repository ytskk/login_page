import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';

class GetBonusesBanner extends StatelessWidget {
  const GetBonusesBanner({
    super.key,
    this.options,
  });

  final Widget? options;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context); 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding16),
          child: RichText(
            text: TextSpan(
              style: appTheme.textTheme.h1,
              text: AppStrings.toGetMoreBonuses.tr(),
              children: [
                TextSpan(
                  text: AppStrings.youCanDo.tr(),
                  style: appTheme.textTheme.h1.copyWith(
                    color: appTheme.colorScheme.yellow,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (options != null) ...[
          const SizedBox(height: spacing16),
          options!,
        ],
      ],
    );
  }
}
