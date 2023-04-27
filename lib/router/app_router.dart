import 'package:go_router/go_router.dart';

import '../controllers/controllers.dart';
import '../screens/edit_profile_screen/edit_profile_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/login_screen/login_screen.dart';

class RoutesBonusesApp {
  GoRouter get router => _router;

  final AuthController authController;

  RoutesBonusesApp({required this.authController});

  late final _router = GoRouter(
      initialLocation: '/home',
      routes: [
        GoRoute(
          path: '/login',
          name: 'login_screen',
          builder: (context, state) => LogInScreen(),
        ),
        GoRoute(
          path: '/home',
          name: 'home_screen',
          builder: (context, state) {
            return HomeScreen();
          },
          redirect: (context, state) {
            // ScaffoldMessenger.of(context).removeCurrentSnackBar();
            return null;
          },
        ),
        GoRoute(
          path: '/edit_profile',
          name: 'edit_profile',
          builder: (context, state) => EditProfileScreen(),
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
      refreshListenable: authController);
}
