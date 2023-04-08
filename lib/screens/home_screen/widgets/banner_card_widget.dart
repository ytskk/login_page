import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_and_testing/constants/app_images.dart';

import '../../../constants/app_colors.dart';



class BannerCardWidget extends StatelessWidget {
  const BannerCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(

        color: AppColors.blueSecondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(AppImages.bannerFigure)),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "You haven't ordered in a while".toUpperCase(),
                style: const TextStyle(
                  fontSize: 24,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 4, bottom: 16),
                child: Text(
                  "You have a lot of bonuses. You can order something for yourself.",
                  style: TextStyle(
                    height: 1.4,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightGrey,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => log('go catalog'),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(130,45),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    )),
                child: const Text(
                  'Go to catalog',
                  style: TextStyle(
                    color: AppColors.darkgrey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
                  ),
          ),
      ]),
    );
  }
}