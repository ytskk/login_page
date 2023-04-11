import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';

class GetBonusesBanner extends StatelessWidget {
  const GetBonusesBanner({
    super.key,
    this.options,
  });

  final Widget? options;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: mediumPadding),
          child: RichText(
            text: TextSpan(
              style: h1TextStyle,
              text: AppStrings.toGetMoreBonuses,
              children: [
                TextSpan(
                  text: AppStrings.youCanDo,
                  style: h1TextStyle.copyWith(
                    color: AppColors.yellow,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (options != null) ...[
          const SizedBox(height: mediumSpacing2),
          options!,
        ],
      ],
    );
  }
}
