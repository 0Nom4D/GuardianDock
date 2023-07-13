import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:guardian_dock/main.dart';

void main() {
  testWidgets('Player search build', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Bungie ID'), findsOneWidget);
  });
}
