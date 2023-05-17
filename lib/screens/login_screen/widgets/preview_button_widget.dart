import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/auth_controller.dart';
import 'package:training_and_testing/router/app_route_names.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/widgets/widgets.dart';

/// {@template preview_button}
/// Button displayed after a successful authorization process. 
/// Contains the user's name and avatar. 
/// {@endtemplate}
class PreviewButtonWidget extends StatelessWidget {
  /// {@macro preview_button}
  const PreviewButtonWidget(
    this.authController, {
    super.key,
  });
  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    final profileInfo = authController.googleProfileInfo.value;
    final appTheme = Theme.of(context);
    if (profileInfo == null) return const SizedBox();
    return BrandButton(
      padding: const EdgeInsets.all(padding4),
      backgroundColor: appTheme.colorScheme.grey70,
      child: ProfilePreviewWidget(
        profileInfo: profileInfo,
        spacing: spacing16,
        textStyle: appTheme.textTheme.h2,
      ),
      onPressed: () => GoRouter.of(context).goNamed(AppRouteNames.home),
    );
  }
}
