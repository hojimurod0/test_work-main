import 'package:flutter_test/flutter_test.dart';
import 'package:test_work/services/counter_service.dart';

void main() {
  group('CounterService Tests', () {
    late CounterService counterService;

    setUp(() {
      counterService = CounterService();
    });

    test('initial count should be 0', () {
      expect(counterService.count, 0);
    });

    test('increment should add 1 to count', () {
      counterService.increment();
      expect(counterService.count, 1);
    });

    test('decrement should subtract 1 from count if count > 0', () {
      counterService.increment();
      counterService.increment();
      counterService.decrement();
      expect(counterService.count, 1);
    });

    test('decrement should not go below 0', () {
      counterService.decrement();
      expect(counterService.count, 0);
    });

    test('reset should set count to 0', () {
      counterService.increment();
      counterService.increment();
      counterService.reset();
      expect(counterService.count, 0);
    });

    test('isEven should return true for even numbers', () {
      expect(counterService.isEven(), true); // 0 is even
      counterService.increment();
      expect(counterService.isEven(), false); // 1 is odd
      counterService.increment();
      expect(counterService.isEven(), true); // 2 is even
    });
  });
}
