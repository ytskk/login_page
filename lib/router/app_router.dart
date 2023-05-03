import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/screens/screens.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class RoutesBonusesApp {
  RoutesBonusesApp({required this.authController});
  GoRouter get router => _router;

  final AuthController authController;

  late final _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/login',
        name: 'login_screen',
        builder: (context, state) => const LogInScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainScaffold(child),
        routes: [
          GoRoute(
            path: '/home',
            name: 'home_screen',
            builder: (context, state) {
              return const HomeScreen();
            },
            routes: [
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: 'notifications',
                name: 'notification_screen',
                builder: (context, state) => const NotificationScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      if (!authController.isLoggedIn.value) {
        return (state.subloc == '/login') ? null : '/login';
      }
      return (state.subloc == '/login')
          ? Future.delayed(const Duration(seconds: 3), () {
              return '/home';
            })
          : null;
    },
    refreshListenable: authController,
  );
}
