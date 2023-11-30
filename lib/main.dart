import 'package:dart_basic/231130/cleric.dart';

void main(List<String> args) {
  var cleric = Cleric(name: '클레릭');

  cleric.selfAid();
  var totalPray = cleric.pray(seconds: 2);
  print(totalPray);
}