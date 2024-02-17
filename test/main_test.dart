import 'package:dart001/main.dart' as dart001;
import 'package:test/test.dart';

void main() {
  test('fibonacci', () {
    expect(dart001.fibonacci(20), 6765);
  });
}
