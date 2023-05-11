import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart' hide FormData, Trans;
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/models/models.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/badges/badges.dart';
import 'package:training_and_testing/widgets/description_card.dart';
import 'package:training_and_testing/widgets/quick_filter_tabs.dart';
import 'package:training_and_testing/widgets/svg_asset.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationScreenController controller =
      Get.find<NotificationScreenController>();

  late ThemeData _appTheme;

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

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        AppStrings.notifications.tr(),
        style: _appTheme.textTheme.h3,
      ),
      automaticallyImplyLeading: false,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(padding16),
          child: SvgAsset.squared(
            assetName: AppIcons.closingIcon,
            size: iconSize20,
            color: _appTheme.colorScheme.white,
            onTap: () => GoRouter.of(context).pop(),
          ),
        ),
      ],
    );
  }

  // window displayed when the user has no notifications
  Widget _buildNoNotificationWindow() {
    return Stack(
      children: [
        SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SvgAsset.squared(
                assetName: AppIcons.noNotificationBell,
                size: iconSize64,
              ),
              const SizedBox(height: padding12),
              Text(
                AppStrings.youHave.tr().toUpperCase(),
                style: _appTheme.textTheme.hero,
              ),
              Text(
                AppStrings.noMessages.tr().toUpperCase(),
                style: _appTheme.textTheme.hero
                    .copyWith(color: _appTheme.colorScheme.blue50),
              ),
            ],
          ),
        ),
        ListView(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _appTheme = Theme.of(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: Obx(() {
        final userNotifications = controller.userNotifications.value;

        if (userNotifications == null) return const SizedBox();

        return RefreshIndicator(
          onRefresh: () async {
            await controller.updateUserNotifications();
          },
          child: (userNotifications.totalNotifications == 0)
              ? _buildNoNotificationWindow()
              : NotificationListWidget(
                  controller: controller,
                  userNotifications: userNotifications,
                ),
        );
      }),
    );
  }
}

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
        return Obx(() => TagBadge(
              onPressed: () {
                controller.selectedFilterType.value = type;
              },
              isSelected: type == controller.selectedFilterType.value,
              // TODO: localization
              child: Text(type?.trEnum() ?? 'All messages'),
            ));
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
        final notification = userNotifications.notifications[index -1];
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
