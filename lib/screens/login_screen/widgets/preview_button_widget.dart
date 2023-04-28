import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/auth_controller.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class PreviewButtonWidget extends StatelessWidget {
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
      child: Row(
        children: [
          // Google Avatar
          ClipOval(
            child: Image.network(
              profileInfo.photoUrl,
              width: iconSize50,
              height: iconSize50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: spacing16),
          // Prifile name
          Text(
            '${authController.googleProfileInfo.value?.firstName} ${authController.googleProfileInfo.value?.lastName}',
            style: appTheme.textTheme.h2,
          ),
        ],
      ),
      onPressed: () => GoRouter.of(context).goNamed('home_screen'),
    );
  }
}
