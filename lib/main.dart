import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'app.dart';
import 'constants/generated/codegen_loader.g.dart';
import 'controllers/auth_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  AuthController authController = Get.put(AuthController());
  await authController.verifyingUserAuthorization();
  
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en',''),Locale('ru','')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: BonusesApp()
    ),
  );
}
