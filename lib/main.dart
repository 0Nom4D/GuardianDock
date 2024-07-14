// coverage:ignore-file
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';

import 'package:guardian_dock/api/client_api.dart';
import 'package:guardian_dock/api/models/access_token.dart';
import 'package:guardian_dock/src/router.dart';
import 'package:guardian_dock/src/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = GetIt.I.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  final apiClient = GetIt.I.registerSingleton<ApiClient>(
    ApiClient(
      accessTokens: (await storage.read(key: 'access')),// tokens != null ? AccessToken.fromJson(jsonDecode(tokens)) : null,
      manifest: (await storage.read(key: 'manifest')),
      callbackJwt: (AccessToken tokens) {
        final storage = GetIt.I<FlutterSecureStorage>();
        storage.write(key: 'access', value: jsonEncode(tokens.toJson()));
      }
    )
  );

  if (apiClient.authorizationTokens == null) {
    await storage.delete(key: 'access');
  }
  runApp(GuardianDock());
}

class GuardianDock extends StatelessWidget {
  final _mainNavigationKey = GlobalKey<NavigatorState>();

  GuardianDock({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GuardianDock',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      routerConfig: GoRouter(
        initialLocation: '/',
        navigatorKey: _mainNavigationKey,
        routes: mainRoutes
      ),
    );
  }
}
