import 'package:flutter/material.dart';

import 'package:guardian_dock/src/router.dart';
import 'package:guardian_dock/src/theme.dart';

void main() {
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
