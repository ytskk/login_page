import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:training_and_testing/app.dart';
import 'package:training_and_testing/constants/generated/codegen_loader.g.dart';
import 'package:training_and_testing/controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final authController = Get.put(AuthController());
  await authController.verifyingUserAuthorization();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', ''), Locale('ru', '')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: BonusesApp(),
    ),
  );
}
