import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart' hide FormData, Trans;
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/models/models.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/badges/badges.dart';
import 'package:training_and_testing/widgets/description_card.dart';
import 'package:training_and_testing/widgets/quick_filter_tabs.dart';
import 'package:training_and_testing/widgets/svg_asset.dart';

class NotificationListWidget extends StatelessWidget {
  const NotificationListWidget({
    required this.controller,
    required this.userNotifications,
    super.key,
  });

  final NotificationScreenController controller;
  final NotificationsModel userNotifications;

  // building badges displaying the type of notification and its novelty
  Widget _trailerBuilder(NotificationItemModel notification) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        LabelBadge.typeLabel(
          content: notification.type.trEnum().toUpperCase(),
        ),
        if (notification.isNew)
          Padding(
            padding: const EdgeInsets.only(left: padding4),
            child: LabelBadge.newLabel(
              content: AppStrings.new_.tr().toUpperCase(),
            ),
          )
      ],
    );
  }

  // building a button to mark the notification as read/unread
  ActionPane _buildHideIconButton({required int index, required bool status}) {
    return ActionPane(
      extentRatio: 0.2,
      motion: const BehindMotion(),
      children: [
        CustomSlidableAction(
          backgroundColor: Colors.transparent,
          onPressed: (_) => {controller.reverseNotificationStatus(index)},
          child: SvgAsset.squared(
            size: iconSize24,
            assetName: status
                ? AppIcons.readNoticeEyeIcon
                : AppIcons.unreadNoticeEyeIcon,
          ),
        ),
      ],
    );
  }

  // area with filters by notification type
  Widget _buildFilterPanel() {
    final listTypes = controller.listTypes;
    return QuickFilterTabs(
      itemCount: listTypes.length,
      itemBuilder: (_, index) {
        final type = listTypes[index];
        return Obx(
          () => TagBadge(
            onPressed: () {
              controller.selectedFilterType.value = type;
            },
            isSelected: type == controller.selectedFilterType.value,
            // TODO: localization
            child: Text(type?.trEnum() ?? 'All messages'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userNotifications.notifications.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _buildFilterPanel();
        }
        final notification = userNotifications.notifications[index - 1];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding16),
          child: Slidable(
            endActionPane: _buildHideIconButton(
              status: notification.isNew,
              index: index - 1,
            ),
            child: DescriptionCard(
              description: notification.description,
              maxLines: 4,
              textStyle: Theme.of(context).textTheme.bodyM.light,
              date: notification.date.trd(context.locale),
              backgroundColor: (notification.isNew)
                  ? Theme.of(context).colorScheme.grey70
                  : Theme.of(context).colorScheme.grey90,
              trailer: _trailerBuilder(notification),
            ).paddingOnly(bottom: padding4),
          ),
        );
      },
    );
  }
}
