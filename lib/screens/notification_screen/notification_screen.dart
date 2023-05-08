import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart' hide FormData;
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/models/models.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/badges/badges.dart';
import 'package:training_and_testing/widgets/description_card.dart';
import 'package:training_and_testing/widgets/svg_asset.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationScreenController controller =
      Get.find<NotificationScreenController>();

  @override
  void initState() {
    controller.updateUserNotifications();
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<NotificationScreenController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    // building badges displaying the type of notification and its novelty
    Widget trailerBuilder(NotificationItemModel notification) {
      return Row(
        children: [
          LabelBadge.typeLabel(
            // TODO: localization ???(and add enum)
            content: notification.type.toUpperCase(),
            context: context,
          ),
          if (notification.isNew)
            Padding(
              padding: const EdgeInsets.only(left: padding4),
              child: LabelBadge.newLabel(
                // TODO: localization
                content: 'new'.toUpperCase(),
                context: context,
              ),
            )
        ],
      );
    }

    // building a button to mark the notification as read/unread
    ActionPane buildHideIconButton({required int index, required bool status}) {
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

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // TODO: localization
        title: const Text('Notifications'),
      ),
      body: Obx(() {
        final userNotifications = controller.userNotifications.value;
        if (userNotifications == null) return const SizedBox();

        return RefreshIndicator(
          onRefresh: () async {
            await controller.updateUserNotifications();
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(padding16),
            itemCount: userNotifications.totalNotifications,
            itemBuilder: (context, index) {
              final notification = userNotifications.notifications[index];
              return Slidable(
                endActionPane: buildHideIconButton(
                  status: notification.isNew,
                  index: index,
                ),
                child: DescriptionCard(
                  description: notification.description,
                  maxLines: 4,
                  textStyle: appTheme.textTheme.bodyM.light,
                  date: notification.date.trd(context.locale),
                  backgroundColor: (notification.isNew)
                      ? Theme.of(context).colorScheme.grey70
                      : Theme.of(context).colorScheme.grey90,
                  trailer: trailerBuilder(notification),
                ).paddingOnly(top: (index != 0) ? padding4 : 0),
              );
            },
          ),
        );
      }),
    );
  }
}
