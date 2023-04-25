import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide Trans;
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/constants/generated/app_strings.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/widgets/widgets.dart';

import '../../controllers/auth_controller.dart';
import '../../widgets/preloader.dart';
import 'widgets/login_button_widget.dart';
import 'widgets/preview_button_widget.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final AuthController authController = Get.find<AuthController>();
  BuildContext? _context;
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    _context = context;
    return Scaffold(
      backgroundColor: appTheme.colorScheme.black,
      body: Obx(
        () => BackgroundImageCard(
          // Background figure
          backgroundImage: SizedBox.expand(
            child: SvgPicture.asset(
              AppIcons.authScreenFigure,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Altenar logo
                const SvgAsset(assetName: AppIcons.altenarLogo),
                const SizedBox(height: spacing80),
                // Text
                Text(
                  AppStrings.getBonusesAndExchangeThemForBrandedProducts
                      .tr()
                      .toUpperCase(),
                  style: titleTextStyle,
                ),
                // Login button
                const SizedBox(height: spacing80),
                (authController.isLoggedIn.value)
                    ? PreviewButtonWidget(authController)
                    : LoginButtonWidget(authController),
              ],
            ),
          ),
        ),
      ),
    );  
  }
}
