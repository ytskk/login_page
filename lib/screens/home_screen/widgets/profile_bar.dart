import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/app_images.dart';
import '../../../controllers/auth_controller.dart';

class ProfileBar extends StatelessWidget {
  final AuthController authController;
  const ProfileBar(this.authController, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  authController.googleProfileInfo.value.photoUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: 80,
                  child: Text(
                    '${authController.googleProfileInfo.value.firstName} ${authController.googleProfileInfo.value.lastName}',
                    style: const TextStyle(
                        color: Colors.white,
                        height: 1.4,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ))
            ],
          ),
          InkWell(
              onTap: () => log('click notification'),
              child: SvgPicture.asset(AppImages.notificationIcon)),
        ],
      ),
    );
  }
}
