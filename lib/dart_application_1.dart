import 'package:fpdart/fpdart.dart';

int calculate() {
  return 6 * 7;
}

/// Sum elements of a list
sumListFold(List<int> list) {
  return (list.fold<int>(0, (premier, second) => premier + second));
}

/// Composability
/// Sum all elements of a list that are greater than 2
sumListWhereFold(List<int> list) {
  return (list
      .where((element) => element > 2)
      .fold<int>(0, (premier, second) => premier + second));
}

/// Extreme example with list
///
/// How can you achieve the same result with Imperative code?
/// Is it even possible? 🤷‍
listETL(List<int> list) {
  return (list
      .where((e) => e > 2)
      .plus([1, 2, 3])
      .drop(2)
      .intersect([1, 2, 3])
      .map((e) => e * 2)
      .take(3)
      .first);
}

/// [Option - getOrElse - *2 True or False]
optionGetOrElse(Option<int> intOption) {
  /// No need to check for `null`
  return (intOption.getOrElse(() => 0) * 2);
}

/// Error handling using [Option] 🎉
Option<double> divideF(int x, int y) {
  if (y == 0) {
    return none();
  }
  return some(x / y);
}
