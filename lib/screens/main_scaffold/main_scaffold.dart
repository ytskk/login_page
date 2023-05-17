import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/widgets/custom_navigation_bar/navigation_bar.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({
    required this.navigationShell,
    required this.children,
    super.key,
  });

  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    final children = widget.children;

    final navigationShell = widget.navigationShell;

    return Scaffold(
      extendBody: true,
      body: Stack(
        fit: StackFit.expand,
        children: children.mapIndexed((int index, Widget view) {
          if (index == navigationShell.currentIndex) {
            return Offstage(offstage: false, child: view);
          } else {
            return Offstage(child: view);
          }
        }).toList(),
      ),
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
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => widget.navigationShell.goBranch(index),
      ),
    );
  }

  // TODO
  @override
  void didUpdateWidget(covariant MainScaffold oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
    );
    super.didUpdateWidget(oldWidget);
  }
}
