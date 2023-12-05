import 'hero.dart';

class Slime {
  int _hp;
  final String _suffix;

  Slime({
    required String name,
  })  : _hp = 50,
        _suffix = name;

  void attack(Hero hero) {
    print('슬라임$_suffix이/가 공격했다.');
    print('10의 데미지');
    hero.hp -= 10;
  }
}
