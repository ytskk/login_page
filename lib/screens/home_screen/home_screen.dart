import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/screens/home_screen/widgets/widgets.dart';
import 'package:training_and_testing/test_room/test_app.dart';
import 'package:training_and_testing/theme/app_colors.dart' as appColorsTest;
import 'package:training_and_testing/widgets/future_widget.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/widgets/widgets.dart';

import '../../api/bonuses_api.dart';
import '../../controllers/controllers.dart';
import '../../widgets/snack_bar_notification.dart';
import 'widgets/profile_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final AuthController authController = Get.find<AuthController>();

  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController(BonusesApi(), '1'));

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Stack(
        children: [
          SvgPicture.asset(AppIcons.backgroundLine),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ProfileBar(authController),
                    const SizedBox(height: spacing24),
                    // banner card
                    RoundedRectangleBox(
                      backgroundColor: colorScheme.grey90,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // TODO: test. Remove.
                          BannerPageView(
                            items: [
                              BannerCard(
                                cardColor: colorScheme.blue70,
                                backgroundImageAlignment: Alignment.bottomRight,
                                backgroundImage: const SvgAsset(
                                  assetName: AppIcons.bannerFigure,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(padding16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppStrings.toBuySomething.toUpperCase(),
                                      ),
                                      const Text(AppStrings.needToGetBonuses),
                                    ],
                                  ),
                                ),
                              ),
                              BannerCard(
                                cardColor: colorScheme.grey50,
                                backgroundImageAlignment: Alignment.topCenter,
                                backgroundImage: SvgAsset(
                                  assetName: AppIcons.bannerFigure,
                                  color: colorScheme.grey60,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(padding16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppStrings.toBuySomething.toUpperCase(),
                                      ),
                                      const Text(AppStrings.needToGetBonuses),
                                      const SizedBox(height: spacing24),
                                      BrandButton(
                                        backgroundColor: colorScheme.yellow,
                                        foregroundColor: colorScheme.black,
                                        onPressed: () {},
                                        child:
                                            const Text(AppStrings.goToCatalog),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          FutureWidget(
                              homeScreenController.updateUserBalance(),
                              Obx(
                                () => BonusBalance(
                                  todayBalanceChange: homeScreenController
                                          .userBalance.value?.todayChanges ??
                                      0,
                                  totalBalance: homeScreenController
                                          .userBalance.value?.totalBalance ??
                                      0,
                                ),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(height: spacing24),
                    BrandButton(
                      onPressed: () {},
                      size: ButtonSize.large,
                      child: const Text(AppStrings.getBonuses),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: spacing32),
              GetBonusesBanner(
                options: SizedBox(
                  height: 56,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: padding16),
                    scrollDirection: Axis.horizontal,
                    children: [
                      BonusesOptionButton(
                        iconPath: AppIcons.writeIcon,
                        title: AppStrings.writeAnArticle,
                        onPressed: () {},
                      ),
                      const SizedBox(width: spacing8),
                      BonusesOptionButton(
                        iconPath: AppIcons.speakerIcon,
                        title: AppStrings.speakAtTheConference,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              const AchievementsBlock(
                achievementsCount: 6,
              ),
              // test buttons
              Row(
                children: [
                  IconButton(
                      // test localizations ru
                      onPressed: () => context.setLocale(Locale('ru')),
                      icon: Icon(Icons.rule_folder_rounded)),
                  IconButton(
                      // test localizations en
                      onPressed: () => context.setLocale(Locale('en')),
                      // onPressed: () async =>  homeScreenController.updateUserOrders(),
                      icon: Icon(Icons.twelve_mp)),
                ],
              ),

              FutureWidget(homeScreenController.updateUserOrders(),
                  OrdersBlock(homeScreenController: homeScreenController)),
              FutureWidget(homeScreenController.updateUserOperations(),
                  OperationsBlock(homeScreenController: homeScreenController))
              // LastOperationsListWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

class BannerPageView extends StatefulWidget {
  const BannerPageView({
    super.key,
    required this.items,
  });

  final List<Widget> items;

  @override
  State<BannerPageView> createState() => _BannerPageViewState();
}

class _BannerPageViewState extends State<BannerPageView> {
  late final PageController _pageController;
  late int _currentPage = 1000000;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      viewportFraction: 1.04,
      initialPage: _currentPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundedRectangleBox(
          child: SizedBox(
            height: 230,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) => setState(() {
                _currentPage = value;
              }),
              itemBuilder: (BuildContext context, int index) {
                return FractionallySizedBox(
                  widthFactor: 1 / _pageController.viewportFraction,
                  child: widget.items[index % widget.items.length],
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: spacing8),
          child: Wrap(
            spacing: spacing6,
            children: [
              ...List.generate(widget.items.length, (index) => index).map(
                (e) => SizedBox(
                  height: 6,
                  width: 6,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: _currentPage % widget.items.length == e
                          ? Colors.white
                          : AppColors.middleGrey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }
}
