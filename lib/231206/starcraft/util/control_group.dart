import 'package:dart_basic/231206/starcraft/interface/army_unionable.dart';

class ControlGroup {
  static const int _maxGroupCapacity = 12;
  static int _groupNumberTracker = 1;
  int _groupNumber;
  List<ArmyUnionable> _group;

  ControlGroup()
      : _group = [],
        _groupNumber = _groupNumberTracker {
    _groupNumberTracker += 1;
  }

  void add(ArmyUnionable unit) {
    if (_group.length < _maxGroupCapacity) {
      _group.add(unit);
    }
  }

  void showAllUnit() {
    print('$_groupNumber번 부대');
    print(_group);
  }
}
