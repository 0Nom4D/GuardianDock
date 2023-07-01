import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:guardian_dock/src/views/home_view.dart';

final _mainNavigationKey = GlobalKey<NavigatorState>();
// final _shellNavigationKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _mainNavigationKey,
  routes: [
    GoRoute(
      path: "/",
      pageBuilder: (context, state) => const NoTransitionPage(
        child: MyHomePage(title: 'Guardian Dock')
      ),
      routes: const []
    ),
    // ShellRoute(
    //   navigatorKey: _shellNavigationKey,
    //   builder: (context, state, child) => ScaffoldWithBottomNavBar(child: child),
    //   routes: [
    //     GoRoute(
    //       path: "/",
    //       pageBuilder: (context, state) => NoTransitionPage(
    //         child: Container()
    //       ),
    //       routes: const []
    //     ),
    //   ]
    // )
  ]
);
