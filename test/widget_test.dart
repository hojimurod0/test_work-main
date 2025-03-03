import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:test_work/main.dart';

void main() {
  group('MainApp Widget Tests', () {
    testWidgets('MainApp should display Hello World text',
        (WidgetTester tester) async {
      // Build our app and trigger a frame
      await tester.pumpWidget(const MainApp());

      // Verify that our app displays 'Hello World'
      expect(find.text('Hello World'), findsOneWidget);
    });

    testWidgets('MainApp should have a Scaffold', (WidgetTester tester) async {
      // Build our app and trigger a frame
      await tester.pumpWidget(const MainApp());

      // Verify that we have a Scaffold
      expect(find.byType(Scaffold), findsOneWidget);
    });
  });
}
