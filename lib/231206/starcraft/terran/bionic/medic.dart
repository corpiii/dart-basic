import 'package:dart_basic/231206/starcraft/interface/medic_curable.dart';
import 'package:dart_basic/231206/starcraft/protoss/protoss_unit/interface/protoss_unit.dart';
import 'interface/bionic.dart';

class Medic extends Bionic {
  void heal(MedicCurable unit) {
    unit.hp += 10;
  }
}