import 'package:go_router/go_router.dart';

import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/router/app_route_names.dart';
import 'package:training_and_testing/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:training_and_testing/screens/home_screen/home_screen.dart';
import 'package:training_and_testing/screens/login_screen/login_screen.dart';
import 'package:training_and_testing/screens/screens.dart';

class RoutesBonusesApp {
  RoutesBonusesApp({required this.authController});
  GoRouter get router => _router;

  final AuthController authController;

  late final _router = GoRouter(
    // initialLocation: '/home',
    // while working on catalog screen, uncomment the line above and comment
    // the line below to set the app initial location.
    initialLocation: '/${AppRouteNames.catalog}',
    routes: [
      GoRoute(
        path: '/login',
        name: 'login_screen',
        builder: (context, state) => const LogInScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home_screen',
        builder: (context, state) {
          return const HomeScreen();
        },
        redirect: (context, state) {
          return null;
        },
      ),
      GoRoute(
        path: '/edit_profile',
        name: 'edit_profile',
        builder: (context, state) => const EditProfileScreen(),
      ),
      AppRoute(
        name: AppRouteNames.catalog,
        builder: (_, __) => const CatalogScreen(),
      ),
    ],
    // commented until catalog screen is in progress
    // redirect: (context, state) {
    //   if (!authController.isLoggedIn.value) {
    //     return (state.subloc == '/login') ? null : '/login';
    //   }
    //   return (state.subloc == '/login')
    //       ? Future.delayed(const Duration(seconds: 3), () {
    //           return '/home';
    //         })
    //       : null;
    // },
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
  }) : super(path: path ?? '/$name');
}
