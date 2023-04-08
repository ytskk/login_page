import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/constants/app_colors.dart';
import 'package:training_and_testing/constants/app_images.dart';

import '../../controllers/auth_controller.dart';
import 'widgets/achieves_list_widget.dart';
import 'widgets/banner_card_widget.dart';
import 'widgets/bonuses_get_button.dart';
import 'widgets/bonuses_info_notification_widget.dart';
import 'widgets/last_operations_list_widget.dart';
import 'widgets/my_orders_list_widget.dart';
import 'widgets/profile_bar.dart';
import 'widgets/status_balance_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Stack(children: [
        SvgPicture.asset(AppImages.backgroundLine),
        ListView(
          children: [
            ProfileBar(authController),
            Stack(
              clipBehavior: Clip.none,
              children: const [
                Positioned(
                  top: 160,
                  child: StatusBalanceWidget(),
                ),
                BannerCardWidget(),
              ],
            ),
            const BonusesGetButton(),
            const BonusesInfoNotificationWidget(),
            AchievesListWidget(),
            MyOrdersListWidget(),
            LastOperationsListWidget(),
          ],
        ),
      ]),
    );
  }
}
