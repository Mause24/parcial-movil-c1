import 'package:go_router/go_router.dart';
import 'package:parcial_c1/routes/general/general_routes.dart';
import 'package:parcial_c1/screens/home/home_screen.dart';
import 'package:parcial_c1/shared/splash_screen.dart';

final GoRouter generalRouter = GoRouter(
  initialLocation: "/splash",
  routes: [
    GoRoute(
      path: GeneralRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: GeneralRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
