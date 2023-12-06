import 'package:dart_basic/231206/starcraft/util/control_group.dart';

import '231206/starcraft/interface/army_unionable.dart';

import '231206/starcraft/protoss/protoss_unit/zealot.dart';
import '231206/starcraft/protoss/protoss_unit/dragun.dart';

import '231206/starcraft/terran/terran_unit/bionic/marine.dart';
import '231206/starcraft/terran/terran_unit/bionic/medic.dart';
import '231206/starcraft/terran/terran_unit/mechanic/scv.dart';
import '231206/starcraft/terran/terran_unit/mechanic/tank.dart';

void main(List<String> args) {
  var scv = SCV(hp: 50);
  var medic = Medic(hp: 50);
  var marine = Marine(hp: 10);
  var tank = Tank(hp: 150);
  var zealot = Zealot(hp: 30, shield: 30);
  var dragun = Dragun(hp: 40, shield: 40);
  var group = ControlGroup();

  print('질럿 회복 전: ${zealot.hp}');
  medic.heal(zealot);
  print('질럿 회복 후: ${zealot.hp}\n');

  print('마린 회복 전: ${marine.hp}');
  medic.heal(marine);
  print('마린 회복 후: ${marine.hp}\n');

  print('드라군 회복 전: ${dragun.hp}');
  scv.repair(dragun);
  print('드라군 회복 후: ${dragun.hp}\n');

  group.add(medic);
  group.add(marine);
  group.add(zealot);
  group.add(tank);
  group.add(scv);

  group.showAllUnit();
}
