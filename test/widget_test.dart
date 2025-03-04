import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_work/widget/widget1.dart';


void main() {
  testWidgets('Tugma bosilganda matn o‘zgarishi', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MyWidget()));

    expect(find.text('Old text'), findsOneWidget);
    expect(find.text('New text'), findsNothing);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Old text'), findsNothing);
    expect(find.text('New text'), findsOneWidget);
  });
}
