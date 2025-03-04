import 'package:flutter_test/flutter_test.dart';
import 'package:test_work/services/calculator_service.dart';


void main() {
  test('CalculatorService: add funksiyasi ikki sonni to‘g‘ri qo‘shyaptimi', () {
    final calculator = CalculatorService();
    expect(calculator.add(2, 3), 5);
    expect(calculator.add(-1, 1), 0);
    expect(calculator.add(0, 0), 0);
  });
}
