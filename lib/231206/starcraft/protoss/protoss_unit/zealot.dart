import 'package:dart_basic/231206/starcraft/interface/medic_curable.dart';
import 'interface/protoss_unit.dart';

class Zealot extends ProtossUnit implements MedicCurable {
  Zealot({
    required super.hp,
    required super.shield,
  });
}
