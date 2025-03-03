import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_work/main.dart';
import 'package:flutter/material.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Counter App Integration Tests', () {
    setUp(() async {
      // Reset the app state before each test
      await Future.delayed(const Duration(seconds: 1));
    });

    tearDown(() async {
      // Clean up after each test
      await Future.delayed(const Duration(seconds: 1));
    });

    testWidgets('Full app flow test', (WidgetTester tester) async {
      // Build our app and trigger a frame
      await tester.pumpWidget(const MainApp());
      await tester.pumpAndSettle();

      // 1. Check initial state
      expect(find.text('Hello World'), findsOneWidget);
      expect(find.text('Count: 0'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.remove), findsOneWidget);

      // 2. Test increment functionality with delay between taps
      await tester.tap(find.byKey(const Key('incrementButton')));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(milliseconds: 500));
      expect(find.text('Count: 1'), findsOneWidget);

      await tester.tap(find.byKey(const Key('incrementButton')));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(milliseconds: 500));
      expect(find.text('Count: 2'), findsOneWidget);

      // 3. Test decrement functionality with delay
      await tester.tap(find.byKey(const Key('decrementButton')));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(milliseconds: 500));
      expect(find.text('Count: 1'), findsOneWidget);

      // 4. Test minimum value (shouldn't go below 0)
      await tester.tap(find.byKey(const Key('decrementButton')));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(milliseconds: 500));
      expect(find.text('Count: 0'), findsOneWidget);

      await tester.tap(find.byKey(const Key('decrementButton')));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(milliseconds: 500));
      expect(find.text('Count: 0'), findsOneWidget); // Should still be 0
    });

    testWidgets('Test UI elements and layout', (WidgetTester tester) async {
      // Build our app and trigger a frame
      await tester.pumpWidget(const MainApp());
      await tester.pumpAndSettle();

      // 1. Verify app structure
      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);

      // 2. Verify AppBar
      expect(find.text('Counter App'), findsOneWidget);

      // 3. Verify main content
      expect(find.text('Hello World'), findsOneWidget);
      expect(find.byKey(const Key('counterText')), findsOneWidget);
      expect(find.text('Count: 0'), findsOneWidget);

      // 4. Verify buttons existence and icons
      expect(find.byKey(const Key('incrementButton')), findsOneWidget);
      expect(find.byKey(const Key('decrementButton')), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.remove), findsOneWidget);

      // 5. Verify button functionality
      await tester.tap(find.byKey(const Key('incrementButton')));
      await tester.pumpAndSettle();
      expect(find.text('Count: 1'), findsOneWidget);
    });

    testWidgets('Test rapid interactions', (WidgetTester tester) async {
      await tester.pumpWidget(const MainApp());
      await tester.pumpAndSettle();

      // Test rapid increment
      for (int i = 0; i < 5; i++) {
        await tester.tap(find.byKey(const Key('incrementButton')));
        await tester.pump(const Duration(milliseconds: 50));
      }
      await tester.pumpAndSettle();
      expect(find.text('Count: 5'), findsOneWidget);

      // Test rapid decrement
      for (int i = 0; i < 3; i++) {
        await tester.tap(find.byKey(const Key('decrementButton')));
        await tester.pump(const Duration(milliseconds: 50));
      }
      await tester.pumpAndSettle();
      expect(find.text('Count: 2'), findsOneWidget);
    });
  });
}
