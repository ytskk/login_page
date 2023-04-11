import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/utils/utils.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({
    super.key,
    required this.title,
    this.subtitle,
    this.callToAction,
    this.backgroundColor,
  });

  final Widget title;
  final String? subtitle;
  final Widget? callToAction;
  final Color? backgroundColor;

  Color get _backgroundColor => backgroundColor ?? AppColors.blueSecondary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: ColoredBox(
          color: _backgroundColor,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              // banner pattern
              SvgPicture.asset(
                AppImages.bannerFigure,
              ),
              // banner texts & button
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title,
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle!,
                        style: bodyMTextStyle.medium.copyWith(
                          color: AppColors.lightGrey,
                        ),
                      ),
                    ],
                    if (callToAction != null) ...[
                      const SizedBox(height: 16),
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
