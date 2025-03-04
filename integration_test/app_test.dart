import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_work/main.dart';


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Tugma bosilganda matn o‘zgarishi (integration test)', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Old text'), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('New text'), findsOneWidget);
  });
}
