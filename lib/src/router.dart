// coverage:ignore-file
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:guardian_dock/api/models/news_article.dart';
import 'package:guardian_dock/src/views/article_view.dart';
import 'package:guardian_dock/src/views/home_view.dart';

final _mainNavigationKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _mainNavigationKey,
  routes: [
    GoRoute(
      path: "/",
      pageBuilder: (context, state) => const NoTransitionPage(
        child: HomeView()
      ),
      routes: const []
    ),
    GoRoute(
      path: '/article/:id',
      pageBuilder: (context, state) {
        NewsArticle detailedArticle = state.extra as NewsArticle;

        return CustomTransitionPage(
          child: ArticleView(article: detailedArticle),
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget? widget) => SlideTransition(
            position: animation.drive(
              Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero
              ).chain(CurveTween(curve: Curves.ease))
            ),
            child: widget
          )
        );
      }
    )
  ]
);
