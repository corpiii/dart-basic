class Cleric {
  int hp;
  final maxHP = 50;

  int mp;
  final maxMP = 10;

  Cleric()
    : hp = 50,
      mp = 10;

  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHP;
    }
  }
}