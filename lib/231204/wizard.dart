import 'dart:math';

import 'package:dart_basic/231204/wand.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  Wizard({
    required String name,
    required int hp,
    required int mp,
    required Wand? wand,
  })  : _name = name,
        _hp = hp,
        _mp = mp,
        _wand = wand;
}