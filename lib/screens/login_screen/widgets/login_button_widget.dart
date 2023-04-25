import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/constants/generated/app_strings.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/widgets/widgets.dart';

import '../../../controllers/auth_controller.dart';
import '../../../widgets/preloader.dart';
import '../../../widgets/snack_bar_notification.dart';
import '../login_screen.dart';

class LoginButtonWidget extends StatefulWidget {
  final AuthController authController;
  const LoginButtonWidget(
    this.authController, {
    super.key,
  });

  @override
  State<LoginButtonWidget> createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends State<LoginButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!widget.authController.startedAuth.value) {
        return _buildGoogleButton(context);
      }
      return _buildPreloaderButton(context);
    });
  }

  Widget _buildGoogleButton(BuildContext context) {
    return BrandButton(
        size: ButtonSize.large,
        onPressed: () async => {
              widget.authController.startedAuth.value = true,
              await widget.authController.signIn(),
              (widget.authController.isLoggedIn.value)
                  ? SnackBarNotification(
                      AppStrings.authorizationWasSuccessful.tr(),
                      type: SnackBarType.positive,
                    ).show(context)
                  : SnackBarNotification(
                      AppStrings.authorizationFailed.tr(),
                      type: SnackBarType.negative,
                    ).show(context),
              widget.authController.startedAuth.value = false,
            },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SvgAsset(assetName: AppIcons.googleIcon),
            const SizedBox(width: spacing10),
            Text(AppStrings.loginWithGoogle.tr(),
                style: Theme.of(context).textTheme.buttonL)
          ],
        ));
  }

  Widget _buildPreloaderButton(context) {
    return BrandButton(
        size: ButtonSize.large,
        padding: const EdgeInsets.all(padding12),
        backgroundColor: Theme.of(context).colorScheme.grey70,
        onPressed: () => {},
        child: Row(
          children: const [
            PreloaderProgressIndicator(size: iconSize32),
          ],
        ));
  }
}
