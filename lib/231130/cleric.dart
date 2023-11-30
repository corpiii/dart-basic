import 'dart:math';

class Cleric {
  String name;
  int hp;
  final maxHP = 50;

  int mp;
  final maxMP = 10;

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