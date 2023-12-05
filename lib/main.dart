import 'package:dart_basic/231205/hero.dart';
import 'package:dart_basic/231205/poison_slime.dart';

void main(List<String> args) {
  var slime = PoisonSlime(suffix: 'A');
  var hero = Hero(49);

  slime.attack(hero);
}