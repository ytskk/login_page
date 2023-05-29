import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class FilterPanelWidget extends StatelessWidget {
  const FilterPanelWidget(this.controller, this.pageController, {super.key});

  final NotificationScreenController controller;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final mapCategories = controller.mapCategories.value;
    final listCategories = controller.listCategories;
    return Padding(
      padding: const EdgeInsets.only(top: padding8, bottom: padding16),
      child: QuickFilterTabs(
        itemCount: listCategories.length,
        hight: NotificationsScreenSized.quickFilterTabsHeight,
        padding: const EdgeInsets.symmetric(horizontal: padding16),
        itemBuilder: (_, index) {
          final category = listCategories[index];
          return Obx(
            () => TagBadge(
              onPressed: () {
                pageController.jumpToPage(index);
              },
              isSelected: category == controller.filterCategory.value,
              // TODO: localization
              child: Text(mapCategories[category] ?? 'All messages'),
            ),
          );
        },
      ),
    );
  }
}
