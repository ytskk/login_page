import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/constants/generated/app_strings.dart';
import 'package:training_and_testing/widgets/widgets.dart';

import '../../../controllers/auth_controller.dart';
import '../../../widgets/snack_bar_notification.dart';

class LoginButtonWidget extends StatelessWidget {
  final AuthController authController;
  const LoginButtonWidget(
    this.authController, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => BrandButton(
        size: ButtonSize.large,
        onPressed: (!authController.startedAuth.value)
            ? () async => {
                  authController.startedAuth.value = true,
                  await authController.signIn(),
                  (authController.isLoggedIn.value)
                      ? SnackBarNotification(
                          LocaleKeys.authorization_was_successful.tr(),
                          type: SnackBarType.positive,
                        ).show(context)
                      : SnackBarNotification(
                          LocaleKeys.authorization_failed.tr(),
                          type: SnackBarType.negative,
                        ).show(context),
                  authController.startedAuth.value = false,
                }
            : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SvgAsset(assetName: AppIcons.googleIcon),
            const SizedBox(width: spacing10),
            Text(LocaleKeys.login_with_Google.tr(), style: buttonLTextStyle)
          ],
        )));
  }
}
