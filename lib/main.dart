import 'package:dart_basic/231204/wand.dart';
import 'package:dart_basic/231204/wizard.dart';

void main(List<String> args) {
  var wand = Wand(name: "딱총나무", power: 10);
  var potter = Wizard(name: "해리포터", hp: 100, mp: 10, wand: wand);
  print(potter);
  potter.name = "해리";
}