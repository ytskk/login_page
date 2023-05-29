import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart' hide Trans;
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/models/models.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget(
    this.controller,
    this.userNotifications, {
    super.key,
  });

  final NotificationsModel userNotifications;

  final NotificationScreenController controller;

  // building badges displaying the type of notification and its novelty
  Widget _trailerBuilder(NotificationItemModel notification) {
    final mapCategories = controller.mapCategories.value;
    final lableText = mapCategories[notification.categorySlug];
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (lableText != null)
          LabelBadge.typeLabel(
            content: lableText.toUpperCase(),
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
  ActionPane _buildHideIconButton({
    required int index,
    required bool status,
    required BuildContext context,
  }) {
    return ActionPane(
      extentRatio: 0.2,
      motion: const BehindMotion(),
      children: [
        CustomSlidableAction(
          backgroundColor: Colors.transparent,
          onPressed: (_) async {
            final res = await controller.reverseNotificationStatus(index);
            // TODO: user inform
            if (!res) SnackBarNotification('message').show(context);
          },
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final notification = userNotifications.notifications[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding16),
          child: Slidable(
            endActionPane: _buildHideIconButton(
              status: notification.isNew,
              index: index,
              context: context,
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
      itemCount: userNotifications.notifications.length,
    );
  }
}
