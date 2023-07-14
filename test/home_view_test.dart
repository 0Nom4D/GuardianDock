import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

import 'package:guardian_dock/main.dart';

@GenerateMocks([http.Client])
void main() {
  testWidgets('Player search build', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('View all your statistics on the same platform.'), findsOneWidget);
    expect(find.text('Bungie ID'), findsOneWidget);
  });

  testWidgets('Player search enter text', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Bungie ID'), findsOneWidget);

    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle(const Duration(milliseconds: 4000));

    await tester.enterText(find.byType(TextField), "aled");
    await tester.pumpAndSettle(const Duration(milliseconds: 2000));

    expect(find.text("aled"), findsOneWidget);
  });
}
