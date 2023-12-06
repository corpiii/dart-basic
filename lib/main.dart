import '231206/starcraft/interface/army_unionable.dart';

import '231206/starcraft/protoss/protoss_unit/zealot.dart';
import '231206/starcraft/protoss/protoss_unit/dragun.dart';

import '231206/starcraft/terran/terran_unit/bionic/marine.dart';
import '231206/starcraft/terran/terran_unit/bionic/medic.dart';
import '231206/starcraft/terran/terran_unit/mechanic/scv.dart';
import '231206/starcraft/terran/terran_unit/mechanic/tank.dart';

void main(List<String> args) {
  List<ArmyUnionable> army = [];
  var scv = SCV(hp: 50);
  var medic = Medic(hp: 50);
  var marine = Marine(hp: 10);
  var tank = Tank(hp: 150);
  var zealot = Zealot(hp: 30, shield: 30);
  var dragun = Dragun(hp: 40, shield: 40);

  print(zealot.hp);
  medic.heal(zealot);
  print(zealot.hp);

  print(marine.hp);
  medic.heal(marine);
  print(marine.hp);

  print(dragun.hp);
  scv.repair(dragun);
  print(dragun.hp);

  army.add(medic);
  army.add(marine);
  army.add(zealot);
  army.add(tank);
  army.add(scv);

  print(army);
}
