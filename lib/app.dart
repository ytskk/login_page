import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/router/app_router.dart';
import 'package:training_and_testing/theme/theme.dart';
import '../controllers/auth_controller.dart';

class BonusesApp extends StatelessWidget {
  BonusesApp({super.key});
  final GoRouter appRouter =
      RoutesBonusesApp(authController: Get.find<AuthController>()).router;

  final appTheme = BrandThemeData.dark();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationProvider: appRouter.routeInformationProvider,
      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,
    );
  }
}
