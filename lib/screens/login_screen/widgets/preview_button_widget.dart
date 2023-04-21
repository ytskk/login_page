import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/constants.dart';
import '../../../controllers/auth_controller.dart';
import '../../../widgets/widgets.dart';

class PreviewButtonWidget extends StatelessWidget {
  final AuthController authController;
  const PreviewButtonWidget(
    this.authController, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final profileInfo = authController.googleProfileInfo.value;
    if (profileInfo == null) return const SizedBox();
    return BrandButton(
      padding: const EdgeInsets.all(padding4),
      backgroundColor: AppColors.grey,
      size: ButtonSize.small,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Google Avatar
          ClipOval(
            child: Image.network(
              profileInfo.photoUrl,
              width: profileIconSize,
              height: profileIconSize,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: spacing16),
          // Prifile name 
          Text(
            "${authController.googleProfileInfo.value?.firstName} ${authController.googleProfileInfo.value?.lastName}",
            style: h2TextStyle,
          ),
        ],
      ),
      onPressed: () => GoRouter.of(context).goNamed('home_screen')
    );
  }
}
