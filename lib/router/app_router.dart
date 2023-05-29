import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/router/app_route_names.dart';
import 'package:training_and_testing/screens/faq/faq_screen.dart';
import 'package:training_and_testing/screens/profile/edit_profile_screen.dart';
import 'package:training_and_testing/screens/screens.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class RoutesBonusesApp {
  RoutesBonusesApp({required this.authController});
  GoRouter get router => _router;

  final AuthController authController;

  late final _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    // initialLocation: '/${AppRouteNames.home}',
    // while working on catalog screen, uncomment the line above and comment
    // the line below to set the app initial location.
    initialLocation: '/${AppRouteNames.catalog}',
    routes: [
      AppRoute.root(path: AppRouteNames.login, widget: const LogInScreen()),
      StatefulShellRoute(
        branches: [
          StatefulShellBranch(
            routes: [
              AppRoute.root(
                path: AppRouteNames.home,
                widget: HomeScreen(),
                routes: [
                  AppRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: AppRouteNames.notifications,
                    widget: const NotificationScreen(),
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              AppRoute.root(
                path: AppRouteNames.catalog,
                widget: const CatalogScreen(),
                routes: [
                  AppRoute(
                    path: AppRouteNames.catalogFilters,
                    widget: const FiltersScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              AppRoute.root(
                path: AppRouteNames.cart,
                widget: const CartScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              AppRoute.root(
                  path: AppRouteNames.profile,
                  widget: ProfileScreen(),
                  routes: [
                    AppRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: AppRouteNames.editProfile,
                      widget: EditProfileScreen(),
                    ),
                    AppRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: AppRouteNames.faq,
                      widget: FaqScreen(),
                    )
                  ]),
            ],
          )
        ],
        navigatorContainerBuilder: (
          BuildContext context,
          StatefulNavigationShell navigationShell,
          List<Widget> children,
        ) =>
            MainScaffold(
          navigationShell: navigationShell,
          children: children,
        ),
        builder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) =>
            navigationShell,
      ),
    ],
    // // commented until catalog screen is in progress
    // redirect: (context, state) {
    //   if (!authController.isLoggedIn.value) {
    //     return (state.matchedLocation == '/${AppRouteNames.login}')
    //         ? null
    //         : '/${AppRouteNames.login}';
    //   }
    //   return (state.matchedLocation == '/${AppRouteNames.login}')
    //       ? Future.delayed(const Duration(seconds: 3), () {
    //           return '/${AppRouteNames.home}';
    //         })
    //       : null;
    // },
    // refreshListenable: authController,
  );
}

class AppRoute extends GoRoute {
  AppRoute({
    required super.path,
    String? name,
    Widget? widget,
    GoRouterWidgetBuilder? builder,
    super.routes,
    super.parentNavigatorKey,
    super.redirect,
  })  : assert(!path.contains('/'), 'path is specified without the "/"'),
        super(
          name: name ?? path,
          builder: (widget != null) ? _widgetForRoute(widget) : builder,
        );

  AppRoute.root({
    required String path,
    String? name,
    Widget? widget,
    GoRouterWidgetBuilder? builder,
    super.routes,
    super.parentNavigatorKey,
    super.redirect,
  })  : assert(!path.contains('/'), 'path is specified without the "/"'),
        super(
          path: '/$path',
          name: name ?? path,
          builder: (widget != null) ? _widgetForRoute(widget) : builder,
        );
}

GoRouterWidgetBuilder _widgetForRoute(Widget widget) => (_, __) => widget;
/// {@template app_route}
/// Wrapper on [GoRoute], implicit sets the [path] to `/$name`. You can
// / override the [path] by passing it to the constructor explicitly.
// class AppRoute extends GoRoute {
//   /// {@macro app_route}
//   AppRoute({
//     super.name,
//     super.builder,
//     String? path,
//     super.routes,
//   }) : super(
//           path: path ?? '/$name',
//         );
// }
