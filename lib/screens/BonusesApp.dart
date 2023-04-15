import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:go_router/go_router.dart';
import '../controllers/auth_controller.dart';
import '../router/app_router.dart';

class BonusesApp extends StatelessWidget {
  BonusesApp({super.key});
  final GoRouter appRouter = RoutesBonusesApp().router;

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController()).checkAuth();
    return MaterialApp.router(
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        textTheme: TextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      routeInformationProvider: appRouter.routeInformationProvider,
      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,
    );
  }
}
