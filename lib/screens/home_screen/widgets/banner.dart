import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/screens/home_screen/widgets/widgets.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/widgets/future_widget.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class MainBanner extends StatelessWidget {
  MainBanner({required this.homeScreenController, super.key});

  final HomeScreenController homeScreenController;

  late ThemeData _appTheme;

  @override
  Widget build(BuildContext context) {
    _appTheme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: padding16,
        vertical: padding24,
      ),
      child: RoundedRectangleBox(
        backgroundColor: Theme.of(context).colorScheme.grey90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SliderCardWidget(
              height: HomeScreenSized.sliderCardHeight,
              items: [_firstCard(), _secondCard()],
            ),
            FutureWidget(
              homeScreenController.updateUserBalance(),
              Obx(() {
                final userBalance = homeScreenController.userBalance.value;
                if (userBalance == null) return const SizedBox();
                return BonusBalance(userBalance: userBalance);
              }),
            )
          ],
        ),
      ),
    );
  }

  BannerCard _firstCard() {
    return BannerCard(
      cardColor: _appTheme.colorScheme.blue70,
      backgroundImageAlignment: Alignment.bottomRight,
      backgroundImage: const SvgAsset(
        assetName: AppIcons.bannerFigure,
      ),
      child: Padding(
        padding: const EdgeInsets.all(padding24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.toBuySomething.tr().toUpperCase(),
              style: _appTheme.textTheme.hero,
            ),
            Text(
              AppStrings.needToGetBonuses.tr().toUpperCase(),
              style: _appTheme.textTheme.hero
                  .copyWith(color: _appTheme.colorScheme.blue30),
            ),
            const SizedBox(height: spacing4),
            Text(
              AppStrings.youHaveALotOfBonusesYouCanOrderSomethingForYourself
                  .tr(),
              style: _appTheme.textTheme.bodyM,
            ),
            const Expanded(child: SizedBox()),
            BrandButton(
              type: ButtonType.secondary,
              foregroundColor: Colors.white,
              onPressed: () {},
              child: Text(AppStrings.howToGetTheBonuses.tr()),
            ),
          ],
        ),
      ),
    );
  }

  BannerCard _secondCard() {
    return BannerCard(
      cardColor: _appTheme.colorScheme.grey70,
      backgroundImageAlignment: Alignment.bottomRight,
      backgroundImage: SvgAsset(
        assetName: AppIcons.bannerFigure,
        color: _appTheme.colorScheme.grey50,
      ),
      child: Padding(
        padding: const EdgeInsets.all(padding24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.toSpendBonuses.tr().toUpperCase(),
              style: _appTheme.textTheme.hero,
            ),
            Text(
              AppStrings.selectSomething.tr().toUpperCase(),
              style: _appTheme.textTheme.hero
                  .copyWith(color: _appTheme.colorScheme.yellow),
            ),
            const SizedBox(height: spacing4),
            Text(
              AppStrings.youHaveALotOfBonusesYouCanOrderSomethingForYourself
                  .tr(),
              style: _appTheme.textTheme.bodyM,
            ),
            const Expanded(child: SizedBox()),
            BrandButton(
              backgroundColor: _appTheme.colorScheme.yellow,
              foregroundColor: _appTheme.colorScheme.black,
              onPressed: () {},
              child: Text(AppStrings.goToCatalog.tr()),
            ),
          ],
        ),
      ),
    );
  }
}
