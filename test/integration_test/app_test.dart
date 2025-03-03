import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_work/main.dart';
import 'package:flutter/material.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Counter App Integration Tests', () {
    testWidgets('Full app flow test', (WidgetTester tester) async {
      // Build our app
      await tester.pumpWidget(const MainApp());

      // 1. Check initial state
      expect(find.text('Hello World'), findsOneWidget);
      expect(find.text('Count: 0'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.remove), findsOneWidget);

      // 2. Test increment functionality
      await tester.tap(find.byKey(const Key('incrementButton')));
      await tester.pumpAndSettle();
      expect(find.text('Count: 1'), findsOneWidget);

      await tester.tap(find.byKey(const Key('incrementButton')));
      await tester.pumpAndSettle();
      expect(find.text('Count: 2'), findsOneWidget);

      // 3. Test decrement functionality
      await tester.tap(find.byKey(const Key('decrementButton')));
      await tester.pumpAndSettle();
      expect(find.text('Count: 1'), findsOneWidget);

      // 4. Test minimum value (shouldn't go below 0)
      await tester.tap(find.byKey(const Key('decrementButton')));
      await tester.pumpAndSettle();
      expect(find.text('Count: 0'), findsOneWidget);

      await tester.tap(find.byKey(const Key('decrementButton')));
      await tester.pumpAndSettle();
      expect(find.text('Count: 0'), findsOneWidget); // Should still be 0

      // 5. Test rapid tapping
      await tester.tap(find.byKey(const Key('incrementButton')));
      await tester.tap(find.byKey(const Key('incrementButton')));
      await tester.tap(find.byKey(const Key('incrementButton')));
      await tester.pumpAndSettle();
      expect(find.text('Count: 3'), findsOneWidget);
    });

    testWidgets('Test UI elements visibility and layout', (WidgetTester tester) async {
      await tester.pumpWidget(const MainApp());

      // Check AppBar
      expect(find.text('Counter App'), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);

      // Check if buttons are properly laid out
      final incrementButton = find.byKey(const Key('incrementButton'));
      final decrementButton = find.byKey(const Key('decrementButton'));
      
      expect(incrementButton, findsOneWidget);
      expect(decrementButton, findsOneWidget);

      // Check if text is centered
      // expect(find.byType(Center), findsOneWidget);
      expect(find.text('Hello World'), findsOneWidget);
    });

    testWidgets('Check MaterialApp and Scaffold', (WidgetTester tester) async {
      await tester.pumpWidget(const MainApp());

      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });
  });
}

