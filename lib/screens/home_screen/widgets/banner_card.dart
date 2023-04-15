import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

// TODO: make more generic. New Widget: box with background image.
class BannerCard extends StatelessWidget {
  const BannerCard({
    super.key,
    required this.title,
    this.subtitle,
    this.callToAction,
    this.backgroundColor,
    this.patternColor,
  });

  final Widget title;
  final String? subtitle;
  final Widget? callToAction;
  final Color? backgroundColor;
  final Color? patternColor;

  Color get _backgroundColor => backgroundColor ?? AppColors.blueSecondary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(mediumPadding),
        child: ColoredBox(
          color: _backgroundColor,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              // banner pattern
              SvgAsset(
                assetName: AppIcons.bannerFigure,
                color: patternColor,
              ),

              // banner texts & button
              Padding(
                padding: const EdgeInsets.all(largePadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title,
                    if (subtitle != null) ...[
                      const SizedBox(height: smallSpacing1),
                      Text(
                        subtitle!,
                        style: bodyMTextStyle.medium.copyWith(
                          color: AppColors.lightGrey,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    if (callToAction != null) ...[
                      // careful! this spacer is needed to push the button to
                      // the bottom means BannerCard must have a fixed height!
                      const Spacer(),
                      const SizedBox(height: mediumSpacing2),
                      callToAction!,
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
