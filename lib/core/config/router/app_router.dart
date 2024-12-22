// config/routes/app_router.dart
import 'package:go_router/go_router.dart';
import 'package:valoratapp/features/home/presentation/pages/home.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
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
    ],
  );
}
