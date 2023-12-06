import 'package:dart_basic/231206/starcraft/protoss/protoss_unit/zealot.dart';
import 'package:dart_basic/231206/starcraft/terran/bionic/marine.dart';
import 'package:dart_basic/231206/starcraft/terran/bionic/medic.dart';

void main(List<String> args) {
  var medic = Medic();
  var marine = Marine(hp: 10);
  var zealot = Zealot(shield: 10, hp: 30);

  print(zealot.hp);
  medic.heal(zealot);
  print(zealot.hp);

  print(marine.hp);
  medic.heal(marine);
  print(marine.hp);

}
