import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/constants/app_styles.dart';

import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/utils/extensions/extensions.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    super.key,
  });

  final HomeScreenController homeScreenController =
      Get.find<HomeScreenController>();

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final profileInfo = authController.googleProfileInfo.value;
    if (profileInfo == null) return const SizedBox();

    Widget buildEditProfileButton() {
      // TODO:
      return BrandButton(
        padding: const EdgeInsets.symmetric(
          horizontal: padding24,
        ),
        type: ButtonType.secondary,
        onPressed: authController.signOut,
        child: Text(
          'Edit',
          style: Theme.of(context).textTheme.bodyS.semibold,
        ),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding16),
          child: ProfilePreviewWidget(
            profileInfo: profileInfo,
            spacing: spacing8,
            sizeAvatar: iconSize32,
            trailer: buildEditProfileButton(),
            textStyle: Theme.of(context).textTheme.bodyL.semibold,
          ),
        ),
        const AchievementsBlock(
          achievementsCount: 6,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
        OrdersBlock(
          homeScreenController: homeScreenController,
          padding: const EdgeInsets.symmetric(vertical: 16),
        )
      ],
    );
  }
}
