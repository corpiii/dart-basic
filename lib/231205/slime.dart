import 'hero.dart';

class Slime {
  int _hp;
  final String _suffix;

  Slime({
    required String suffix,
  })  : _hp = 50,
        _suffix = suffix;

  void attack(Hero hero) {
    hero.hp -= 10;

    print('슬라임$_suffix이/가 공격했다.');
    print('10의 데미지');
  }
}
