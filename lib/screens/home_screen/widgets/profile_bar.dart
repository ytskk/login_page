import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/api/bonuses_api.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/router/router.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar(this.authController, {super.key});

  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final profileInfo = authController.googleProfileInfo.value;
      if (profileInfo == null) return const SizedBox();

      Widget buildNotificationIconButton() {
        return GestureIcon.fromAssetName(
          assetName: AppIcons.notificationIcon,
          size: iconSize24,
          onTap: () {
            Get.put(NotificationScreenController(BonusesApi(), '2'));
            GoRouter.of(context).pushNamed(AppRouteNames.notifications);
          },
        );
      }

      return ProfilePreviewWidget(
        profileInfo: profileInfo,
        spacing: spacing8,
        transposition: true,
        trailer: buildNotificationIconButton(),
      );
    });
  }
}
