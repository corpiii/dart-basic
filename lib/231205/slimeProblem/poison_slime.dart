import 'dart:math';

import 'package:dart_basic/231205/slimeProblem/slime.dart';
import 'hero.dart';

class PoisonSlime extends Slime {
  static const _maxPoisonAttackCount = 5;

  int _attackCount;

  PoisonSlime({
    required super.suffix,
  }) : _attackCount = _maxPoisonAttackCount;

  @override
  void attack(Hero hero) {
    super.attack(hero);

    if (_attackCount != 0) {
       var dividedByFive = hero.hp / 5;
       var roundedDamage = dividedByFive.round().toInt();

       hero.hp -= roundedDamage.toInt();
       _attackCount = max(_attackCount - 1, 0);

       print('추가로, 독 포자를 살포했다!');
       print('$roundedDamage포인트의 데미지');
    }
  }
}
