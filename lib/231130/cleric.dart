import 'dart:math';

class Cleric {
  static const _maxHP = 50;
  static const _maxMP = 10;

  String name;
  int hp;
  int mp;

  Cleric(
    this.name, {
      this.hp = _maxHP,
      this.mp = _maxMP,
  });

  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = _maxHP;
    }
  }

  int pray({required int seconds}) {
    int preHealedMP = mp;
    int healMP = seconds + Random().nextInt(3);

    mp = min(mp + healMP, _maxMP);

    return mp - preHealedMP;
  }
}
