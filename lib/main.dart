import 'package:dart_basic/231205/slimeProblem/hero.dart';
import 'package:dart_basic/231205/slimeProblem/poison_slime.dart';

void main(List<String> args) {
  var slime = PoisonSlime(suffix: 'A');
  var hero = Hero(49);

  slime.attack(hero);
}