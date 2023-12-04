import 'dart:math';

import 'package:dart_basic/231204/wand.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

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
    validateMPAndSet(value);
  }

  Wand? get wand => _wand;

  set wand(Wand? wand) {
    validateWandAndSet(wand);
  }

  Wizard({
    required String name,
    required int hp,
    required int mp,
    required Wand? wand,
  })  : _name = name,
        _hp = hp,
        _mp = mp {
    validateNameAndSet(name);
    validateWandAndSet(wand);
    validateMPAndSet(mp);
  }

  void validateNameAndSet(String name) {
    if (name.length >= 3) {
      _name = name;
    } else {
      throw Exception('Name must be at least 3 letters');
    }
  }

  void validateWandAndSet(Wand? wand) {
    if (wand == null) {
      throw Exception('\'wand\' cannot be assigned null.');
    } else {
      _wand = wand;
    }
  }

  void validateMPAndSet(int mp) {
    if (mp < 0) {
      throw Exception('\'mp\' must be greater than 0.');
    } else {
      _mp = mp;
    }
  }
}