import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/screens/screens.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CatalogController(
        userController: Get.find(),
        bonusRepository: Get.find(),
      ),
      filter: (_) => false,
      builder: (_) => const CatalogScreenView(),
    );
  }
}

class CatalogScreenView extends StatelessWidget {
  const CatalogScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            const CatalogAppBar(),
            SliverStickyHeader(
              header: const CatalogCategoriesTabsView(),
              sliver: const CatalogProductsListView(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: spacing80),
            ),
          ],
        ),
      ),
    );
  }
}
