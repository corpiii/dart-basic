import 'package:dart_basic/problem/problem3/character.dart';
import 'package:dart_basic/problem/problem3/fight_manager.dart';

void problem3() {
  var hero = Character(health: 100, attack: 10, defense: 1);
  var slime = Character(health: 10, attack: 5, defense: 5);
  var fightManager = FightManager(hero: hero, slime: slime);

  fightManager.startFight();
}