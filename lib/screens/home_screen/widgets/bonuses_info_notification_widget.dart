import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';

class BonusesInfoNotificationWidget extends StatelessWidget {
  const BonusesInfoNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 21,
              ),
              SvgPicture.asset(AppImages.flyingStar),
              InkWell(
                child: SvgPicture.asset(AppImages.closingIcon),
                onTap: () => log('close info notification'),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 16, top: 6),
            child: Text(
              'Learn more about how to get bonuses and what you can spend them on',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 14,
                height: 1.45,
              ),
            ),
          ),
          OutlinedButton(
              onPressed: () => log('bonus info'),
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: AppColors.blueMain,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  minimumSize: const Size(double.infinity, 44)),
              child: const Text(
                'How to get the bonuses',
                style: TextStyle(color: AppColors.blueMain),
              ))
        ],
      ),
    );
  }
}
