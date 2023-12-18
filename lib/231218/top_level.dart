import 'package:collection/collection.dart';

bool isEven(int number) {
  return number % 2 == 0 ? true : false;
}

int findMax(List<int> list) {
  return list.max;
}

String reverseString(String word) {
  return word.split('').reversed.toList().join();
}