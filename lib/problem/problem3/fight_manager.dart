import 'package:dart_basic/problem/problem3/character.dart';

class FightManager {
  Character hero;
  Character slime;

  FightManager({required this.hero, required this.slime});

  void startFight() {
    int damage;
    print("Hero vs Slime");

    while (slime.health > 0) {
      _printFighterStates();

      damage = slime.calculateAttackDamage(hero);
      hero.damagedBy(damage);
      print("Slime attacks! Hero takes $damage damage.");

      damage = hero.calculateAttackDamage(slime);
      slime.damagedBy(damage);
      print("Hero attacks! Slime takes $damage damage.");
    }

    print("\nSlime is defeated! Hero wins!");
  }

  void _printFighterStates() {
    print('''
    
Hero - Health: ${hero.health}, Attack: ${hero.attack}, Defense: ${hero.defense}
Slime - Health: ${slime.health}, Attack: ${slime.attack}, Defense: ${slime.defense}''');
  }
}