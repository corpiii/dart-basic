import 'dart:math';

class Cleric {
  static const maxHP = 50;
  static const maxMP = 10;

  String name;
  int hp;
  int mp;

  Cleric(
    this.name, {
      this.hp = maxHP,
      this.mp = maxMP,
  });

  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHP;
    }
  }

  int pray({required int seconds}) {
    int preHealedMP = mp;
    int healMP = seconds + Random().nextInt(3);

    mp = min(mp + healMP, maxMP);

    return mp - preHealedMP;
  }
}
