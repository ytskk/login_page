import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/router/app_router.dart';
import 'package:training_and_testing/theme/theme.dart';

class BonusesApp extends StatelessWidget {
  final GoRouter appRouter = RoutesBonusesApp().router;
  final appTheme = BrandThemeData.dark();

  BonusesApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: DI
    // Get.put(AuthController()).checkAuth();

    return MaterialApp.router(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      routeInformationProvider: appRouter.routeInformationProvider,
      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,
    );
  }
}
