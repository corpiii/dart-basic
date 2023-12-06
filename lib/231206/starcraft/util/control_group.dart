import 'package:dart_basic/231206/starcraft/interface/army_unionable.dart';

class ControlGroup {
  List<ArmyUnionable> _group;

  ControlGroup() : _group = [];

  void add(ArmyUnionable unit) {
    if (_group.length < 12) {
      _group.add(unit);
    }
  }

  void showAllUnit() {
    print(_group);
  }
}