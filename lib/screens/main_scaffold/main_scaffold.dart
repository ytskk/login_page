import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/widgets/custom_navigation_bar/navigation_bar.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold(this.child, {super.key});

  final Widget? child;

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Scaffold(
      extendBody: true,
      body: widget.child,
      bottomNavigationBar: AppNavigationBar(
        selectedColor: appTheme.colorScheme.blue50,
        unSelectedColor: appTheme.colorScheme.grey10,
        backgroundColor: appTheme.colorScheme.grey90,
        borderRadius: const Radius.circular(borderRadius100),
        padding: const EdgeInsets.all(padding8),
        margin: const EdgeInsets.only(
          bottom: padding16,
          left: padding16,
          right: padding16,
        ),
        items: [
          AppNavigationBarItem(
            icon: AppIcons.nbarUnselectMainIcon,
            selectedIcon: AppIcons.nbarSelectMainIcon,
            title: 'Main',
          ),
          AppNavigationBarItem(
            showBadge: true,
            icon: AppIcons.nbarUnselectCatalogIcon,
            selectedIcon: AppIcons.nbarSelectCatalogIcon,
            title: 'Catalog',
          ),
          AppNavigationBarItem(
            badgeCount: 11,
            showBadge: true,
            icon: AppIcons.nbarUnselectBasketIcon,
            selectedIcon: AppIcons.nbarSelectBasketIcon,
            title: 'Basket',
          ),
          AppNavigationBarItem(
            icon: AppIcons.nbarUnselectProfileIcon,
            selectedIcon: AppIcons.nbarSelectProfileIcon,
            title: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            switch (index) {
              case 0:
                GoRouter.of(context).go('/home');
                break;
              case 1:
                log('go to catalog');
                break;
              case 2:
                log('go to basket');
                break;
              case 3:
                log('go profile page');
            }
          });
        },
      ),
    );
  }

  @override
  void didUpdateWidget(covariant MainScaffold oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
    );
    super.didUpdateWidget(oldWidget);
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   WidgetsBinding.instance.addPostFrameCallback(
  //     (_) => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
  //   );
  // }
}
