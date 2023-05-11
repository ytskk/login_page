import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/router/app_route_names.dart';
import 'package:training_and_testing/screens/screens.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class RoutesBonusesApp {
  RoutesBonusesApp({required this.authController});
  GoRouter get router => _router;

  final AuthController authController;

  late final _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    // while working on catalog screen, uncomment the line above and comment
    // the line below to set the app initial location.
    // initialLocation: '/${AppRouteNames.catalog}',
    routes: [
      GoRoute(
        path: '/login',
        name: 'login_screen',
        builder: (context, state) => const LogInScreen(),
      ),
      StatefulShellRoute(
        branches: [],
        navigatorContainerBuilder: (
          BuildContext context,
          StatefulNavigationShell navigationShell,
          List<Widget> children,
        ) =>
            MainScaffold(navigationShell: navigationShell, children: children),
      ),
      //   ShellRoute(
      //     builder: (context, state, child) => MainScaffold(child),
      //     routes: [
      //       GoRoute(
      //         path: '/home',
      //         name: 'home_screen',
      //         builder: (context, state) {
      //           return const HomeScreen();
      //         },
      //         routes: [
      //           GoRoute(
      //             parentNavigatorKey: _rootNavigatorKey,
      //             path: 'notifications',
      //             name: 'notification_screen',
      //             builder: (context, state) => const NotificationScreen(),
      //           ),
      //         ],
      //       ),
      //       GoRoute(
      //         path: '/profile',
      //         name: 'profile_screen',
      //         builder: (context, state) => ProfileScreen(),
      //       ),
      //       AppRoute(
      //         name: AppRouteNames.catalog,
      //         builder: (_, __) => const CatalogScreen(),
      //         routes: [
      //           AppRoute(
      //             name: AppRouteNames.catalogFilters,
      //             path: AppRouteNames.catalogFilters,
      //             builder: (_, __) => const FiltersScreen(),
      //           ),
      //         ],
      //       ),
      //       AppRoute(
      //         name: AppRouteNames.cart,
      //         builder: (_, __) => const CartScreen(),
      //       ),
      //     ],
      //   ),
    ],
    // commented until catalog screen is in progress
    redirect: (context, state) {
      if (!authController.isLoggedIn.value) {
        return (state.matchedLocation == '/login') ? null : '/login';
      }
      return (state.matchedLocation == '/login')
          ? Future.delayed(const Duration(seconds: 3), () {
              return '/home';
            })
          : null;
    },
    refreshListenable: authController,
  );
}

/// {@template app_route}
/// Wrapper on [GoRoute], implicit sets the [path] to `/$name`. You can
/// override the [path] by passing it to the constructor explicitly.
class AppRoute extends GoRoute {
  /// {@macro app_route}
  AppRoute({
    super.name,
    super.builder,
    String? path,
    super.routes,
  }) : super(
          path: path ?? '/$name',
        );
}
