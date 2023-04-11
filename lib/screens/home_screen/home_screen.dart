import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/constants/app_colors.dart';
import 'package:training_and_testing/constants/app_images.dart';
import 'package:training_and_testing/constants/constants.dart';

import 'package:training_and_testing/controllers/auth_controller.dart';
import 'package:training_and_testing/widgets/buttons/buttons.dart';
import 'package:training_and_testing/widgets/widgets.dart';
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
      body: Stack(
        children: [
          SvgPicture.asset(AppImages.backgroundLine),
          // TODO: remove
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                ProfileBar(authController),
                const SizedBox(height: 24),
                RoundedRectangleBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BannerCard(
                        title: RichText(
                          text: TextSpan(
                            style: heroTextStyle,
                            children: [
                              TextSpan(
                                text: AppStrings.toBuySomething.toUpperCase(),
                              ),
                              const TextSpan(text: '\n'),
                              TextSpan(
                                text: AppStrings.needToGetBonuses.toUpperCase(),
                                style: heroTextStyle.copyWith(
                                  color: AppColors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitle: AppStrings.infoMainBannerSubtitle,
                        callToAction: ButtonPrimary(
                          onPressed: () {},
                          backgroundColor: Colors.white,
                          type: ButtonType.secondary,
                          child: const Text(AppStrings.howToGetBonuses),
                        ),
                      ),
                      StatusBalance(
                        todayBalanceChange: 150,
                        totalBalance: 2150,
                      ),
                    ],
                  ),
                ),
                const BonusesGetButton(),
                const BonusesInfoNotificationWidget(),
                AchievesListWidget(),
                MyOrdersListWidget(),
                LastOperationsListWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
