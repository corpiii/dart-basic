import 'dart:math';

class Cleric {
  static final maxHP = 50;
  static final maxMP = 10;

  String name;
  int hp;
  int mp;

  Cleric({required this.name})
    : hp = 50,
      mp = 10;

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