import 'package:coinin_test/src/core/navigation/app_shell.dart';
import 'package:coinin_test/src/core/navigation/navigation_transition.dart';
import 'package:coinin_test/src/core/widgets/theme_background.dart';
import 'package:coinin_test/src/features/settings/presentation/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppPages {
  settings('/settings'),
  //shell main routes
  home('/home'),
  search('/search'),
  history('/history'),
  collection('/collection');

  const AppPages(this.path);
  final String path;
}

sealed class AppRoutes {
  static GoRouter createRouter() {
    return GoRouter(
      initialLocation: AppPages.home.path,
      routes: [
        GoRoute(
          path: AppPages.home.path,
          name: AppPages.home.name,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return FadeTransitionPage(
              state.pageKey,
              ThemeBackground(
                child: const AppShell(),
              ),
            );
          },
        ),
        GoRoute(
          path: AppPages.settings.path,
          name: AppPages.settings.name,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return SlideFromSideTransitionPage(
              state.pageKey,
              ThemeBackground(
                child: const SettingsScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
