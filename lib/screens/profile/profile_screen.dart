import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/api/bonuses_api.dart';
import 'package:training_and_testing/constants/app_styles.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/models/models.dart';
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
        //top indent
        const SizedBox(height: spacing16),

        // 
        _BuildProfilePreviewWidget(profileInfo).paddingAll(padding16),

        //
        BalanceBanner(homeScreenController),

        // achieves block
        const AchievementsBlock(
          achievementsCount: 6,
          // TODO: localization
          trailing: TrailerButtonTemplate(title: 'All achieves'),
        ).paddingAll(padding16),

        // orders block
        OrdersBlock(
          homeScreenController: homeScreenController,
          // TODO: localization
          trailing: const TrailerButtonTemplate(title: 'All orders'),
        ).paddingSymmetric(vertical: padding16),

        // button group
        const _BuildButtonGroup().paddingAll(padding16),
      ],
    );
  }
}

class _BuildProfilePreviewWidget extends StatelessWidget {
  const _BuildProfilePreviewWidget(this.profileInfo);

  final GoogleUserModel profileInfo;

  @override
  Widget build(BuildContext context) {
    return ProfilePreviewWidget(
      profileInfo: profileInfo,
      spacing: spacing8,
      sizeAvatar: iconSize32,
      trailer: TrailerButtonTemplate(
        // TODO: localization
        title: 'Edit',
        onTap: () => GoRouter.of(context).pushNamed(AppRouteNames.editProfile),
      ),
      textStyle: Theme.of(context).textTheme.bodyL.semibold,
    );
  }
}

class _BuildButtonGroup extends StatelessWidget {
  const _BuildButtonGroup();

  @override
  Widget build(BuildContext context) {
    return SegmentedButtonWidget(
      backgroundColor: Theme.of(context).colorScheme.grey70,
      itemBackgroundColor: Theme.of(context).colorScheme.grey90,
      indent: 1,
      children: [
        SegmentedButtonItem.chevron(
          // TODO: localization
          title: 'F.A.Q',
          onTap: (){
            Get.put(FaqScreenController(BonusesApi()));
            GoRouter.of(context).pushNamed(AppRouteNames.faq);
          },
        ),
        const SegmentedButtonItem.chevron(
          // TODO: localization
          title: 'Feedback',
        ),
      ],
    );
  }
}
