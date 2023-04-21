import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/utils/utils.dart';
import '../../../controllers/auth_controller.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar(this.authController, {super.key});

  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final profileInfo = authController.googleProfileInfo.value;
      if (profileInfo == null) return const SizedBox();

      const double profileNameAreaWidth = 68; 

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // profile avatar
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              profileInfo.photoUrl,
              width: profileIconSize,
              height: profileIconSize,
              fit: BoxFit.cover,
            ),
          ),
          // full name
          Container(
              padding: const EdgeInsets.only(left: smallPadding2),
              width: profileNameAreaWidth,
              child: Text(
                  '${profileInfo.firstName} ${profileInfo.lastName}',
                  style: bodyMTextStyle.medium
                      .copyWith(color: AppColors.white))),
          const Expanded(child: SizedBox()),
          // notification button 
          InkWell(
              onTap: () async {
                await authController.signOut();
                log('click notification');
              },
              child: SvgPicture.asset(
                AppIcons.notificationIcon,
              )),
        ],
      );
    });
  }
}
