import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/utils/extensions/extensions.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class BalanceBanner extends StatelessWidget {
  const BalanceBanner(this.homeScreenController, {super.key});

  final HomeScreenController homeScreenController;

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding16),
      child: Column(
        children: [
          Text(
            "Don't know",
            style: Theme.of(context).textTheme.h2,
          ),
          Text(
            'how to get bonuses?',
            style: Theme.of(context)
                .textTheme
                .h2
                .copyWith(color: Theme.of(context).colorScheme.blue50),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.only(
          left: padding16,
          right: padding16,
          bottom: padding24,
        ),
        child: BrandButton(
          type: ButtonType.secondary,
          child: Text('Learn more'),
          onPressed: () => log('learn more'),
        ),
      ),
    );
  }

  Widget _buildBalanceCard(BuildContext context) {
    return Obx(() {
      final userBalance = homeScreenController.userBalance.value;

      if (userBalance == null) return const SizedBox();

      return RoundedRectangleBox(
        innerPadding: const EdgeInsets.all(padding24),
        backgroundColor: Theme.of(context).colorScheme.grey70,
        child: Row(
          children: [
            Expanded(
              child: Text(
                tr(AppStrings.bonusBalance),
                style: Theme.of(context).textTheme.h3,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${userBalance.totalBalance}',
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.hero.medium.copyWith(
                            color: Theme.of(context).colorScheme.yellow,
                          ),
                    ),
                  ),
                  const SizedBox(width: spacing4),
                  CoinIcon(
                    size: iconSize16,
                    color: Theme.of(context).colorScheme.yellow,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding16),
      child: RoundedRectangleBox(
        backgroundColor: Theme.of(context).colorScheme.grey90,
        child: Column(
          children: [
            _buildBalanceCard(context),
            _buildHeader(context),
            _buildActionButton(),
          ],
        ),
      ),
    );
  }
}
