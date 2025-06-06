import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:threadsposter/widgets/widgets.dart';
import 'package:threadsposter/services/api.dart';

final routerConfig = GoRouter(
  initialLocation: '/home',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => const NoTransitionPage<void>(
        child: Home()
      ),
    ),
    GoRoute(
      path: '/post',
      pageBuilder: (context, state) => const NoTransitionPage<void>(
        child: Post()
      ),
      routes: <RouteBase>[
        GoRoute(
          path: 'result',
          pageBuilder: (context, state) => const NoTransitionPage<void>(
            child: PostResult()
          ),
        )
      ]
    ),
    GoRoute(
      path: '/setting',
      pageBuilder: (context, state) => const NoTransitionPage<void>(
        child: Setting()
      ),
    ),
  ],
  redirect: (context, state) {
    final currentPath = state.uri.path;
    if (currentPath == '/') {
      return '/home';
    }
    return null;
  },
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Page not found: ${state.uri.path}'),
    ),
  ),
);

class NavigationService {
  NavigationService();

  String getCurrentPath(BuildContext context) {
    return GoRouterState.of(context).uri.path;
  }

  void goHome() {
    routerConfig.go('/home');
  }

  void goPost({required String tone}) {
    routerConfig.go('/post');
    currentTone = tone;
  }

  void goSetting() {
    routerConfig.go('/setting');
  }

  void goPostResult(List<GeneratedPost> postResult) {
    routerConfig.go('/post/result');
    currentResult = postResult;
  }
  // To work with the web browser history, do not use Navigator.push() or pop() directly
  // void pushFiltersOnHome({required BuildContext context}) {
  //   var path = _currentPath(context);
  //   switch (path) {
  //     case '/categories':
  //       _router.go('/categories/filters');
  //       return;
  //     case '/favorites':
  //       _router.go('/favorites/filters');
  //       return;
  //   }
  //   throw Exception('Cannot push filters on the path: $path');
  // }

  // void goMealsOnCategory({required String categoryId}) {
  //   _router.go('/categories/$categoryId/meals');
  // }

  // void goMealDetailsOnFavorites({required String mealId}) {
  //   _router.go('/favorites/$mealId');
  // }
}
