// config/routes/app_router.dart
import 'package:go_router/go_router.dart';
import 'package:valoratapp/core/config/ui/pages/base_page.dart';
import 'package:valoratapp/core/config/ui/pages/splash_page.dart';
import 'package:valoratapp/features/agents/domain/entities/agents.dart';
import 'package:valoratapp/features/agents/presentation/pages/agents.dart';
import 'package:valoratapp/features/agents/presentation/pages/detail_agent.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/base',
        builder: (context, state) => const BasePage(),
        routes: [
          GoRoute(
              path: '/agents',
              builder: (context, state) => const AgentsPage(),
              routes: [
                GoRoute(
                    path: '/detailsAgent',
                    builder: (context, state) {
                      final Agent agent = state.extra as Agent;
                      return DetailAgent(agent: agent);
                    }),
              ]),
          // GoRoute(
          //   path: 'feature2',
          //   builder: (context, state) => Feature2Page(),
          // ),
        ],
      ),
    ],
  );
}
