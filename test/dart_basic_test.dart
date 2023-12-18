import 'package:dart_basic/231218/top_level.dart';
import 'package:test/test.dart';

void main() {
  test('when_number_is_given_then_judge_even_or_odd', () {
    expect(isEven(0), true);
    expect(isEven(3), false);
    expect(isEven(4), true);
  });
}
