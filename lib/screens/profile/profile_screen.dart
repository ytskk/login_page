import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/constants/app_styles.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/router/router.dart';
import 'package:training_and_testing/screens/profile/widgets/widgets.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/extensions/extensions.dart';
import 'package:training_and_testing/widgets/segmented_button/segmented_button.dart';
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

    return ListView(
      children: [
        ProfilePreviewWidget(
          profileInfo: profileInfo,
          spacing: spacing8,
          sizeAvatar: iconSize32,
          trailer: TrailerButtonTemplate(
            title: 'Edit',
            onTap: () =>
                GoRouter.of(context).pushNamed(AppRouteNames.editProfile),
          ),
          textStyle: Theme.of(context).textTheme.bodyL.semibold,
        ).paddingSymmetric(horizontal: padding16),
        const BalanceBanner(),
        
        // achieves 
        const AchievementsBlock(
          achievementsCount: 6,
          trailing: TrailerButtonTemplate(title: 'All achieves'),
        ).paddingSymmetric(horizontal: padding16),

        // orders
        OrdersBlock(
          homeScreenController: homeScreenController,
          trailing: const TrailerButtonTemplate(title: 'All orders'),
        ),

        // button group
        Padding(
          padding: const EdgeInsets.all(padding16),
          child: SegmentedButtonWidget(
            backgroundColor: Theme.of(context).colorScheme.grey70,
            itemBackgroundColor: Theme.of(context).colorScheme.grey90,
            indent: 1,
            children: const [
              SegmentedButtonItem.chevron(
                title: 'F.A.Q',
              ),
              SegmentedButtonItem.chevron(
                title: 'Feedback',
              ),
            ],
          ),
        )
      ],
    );
  }
}
