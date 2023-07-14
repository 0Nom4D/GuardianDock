import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'package:guardian_dock/api/client_api.dart';
import 'package:guardian_dock/src/router.dart';
import 'package:guardian_dock/src/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  GetIt.I.registerSingleton<ApiClient>(ApiClient());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GuardianDock',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      routerConfig: router,
    );
  }
}
