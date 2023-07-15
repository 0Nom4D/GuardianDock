import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:guardian_dock/src/widgets/empty_suggestion_tile.dart';

void main() {
  testWidgets('Empty suggestion build', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemBuilder: (context, index) => const EmptySuggestionTile(),
          itemCount: 5,
        ),
      ),
    ));

    await tester.pumpAndSettle();
    expect(find.byType(EmptySuggestionTile), findsNWidgets(5));
  });
}
