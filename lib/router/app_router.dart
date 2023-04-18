import 'package:go_router/go_router.dart';

import '../screens/home_screen/home_screen.dart';
import '../screens/login_screen/login_screen.dart';

class RoutesBonusesApp {
  GoRouter get router => _router;

  final _router = GoRouter(
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
        builder: (context, state) => HomeScreen(),
      ),
    ],
    // redirect: (context, state) => ,
    // refreshListenable:
  );
}
