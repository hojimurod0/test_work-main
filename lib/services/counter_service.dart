class CounterService {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
  }

  void decrement() {
    if (_count > 0) {
      _count--;
    }
  }

  void reset() {
    _count = 0;
  }

  bool isEven() {
    return _count % 2 == 0;
  }
}
