// config/routes/app_router.dart
import 'package:go_router/go_router.dart';
import 'package:valoratapp/core/config/ui/pages/base_page.dart';
import 'package:valoratapp/core/config/ui/pages/splash_page.dart';
import 'package:valoratapp/features/home/presentation/pages/home.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashPage(),
        routes: const [
          // GoRoute(
          //   path: 'feature1',
          //   builder: (context, state) => Feature1Page(),
          // ),
          // GoRoute(
          //   path: 'feature2',
          //   builder: (context, state) => Feature2Page(),
          // ),
        ],
      ),
      GoRoute(
        path: '/base',
        builder: (context, state) => const BasePage(),
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomePage(),
          ),
          // GoRoute(
          //   path: 'feature2',
          //   builder: (context, state) => Feature2Page(),
          // ),
        ],
      ),
    ],
  );
}
