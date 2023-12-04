import 'dart:math';

import 'package:dart_basic/231204/wand.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? wand;

  String get name => _name;

  set name(String value) {
    validateNameAndSet(value);
  }

  int get hp => _hp;

  set hp(int hp) {
    _hp = max(0, hp);
  }

  int get mp => _mp;

  set mp(int value) {
    _mp = value;
  }

  Wizard({
    required String name,
    required int hp,
    required int mp,
    required this.wand,
  })  : _name = name,
        _hp = hp,
        _mp = mp {
    validateNameAndSet(name);
  }

  void validateNameAndSet(String name) {
    if (name.length >= 3) {
      _name = name;
    } else {
      throw Exception('Name must be at least 3 letters');
    }
  }
}