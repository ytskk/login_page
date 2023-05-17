import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, Trans;
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/screens/notification_screen/widgets/notification_list.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/widgets/widgets.dart';

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

