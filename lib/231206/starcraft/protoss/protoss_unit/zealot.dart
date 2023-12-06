import 'package:dart_basic/231206/starcraft/interface/medic_curable.dart';
import 'package:dart_basic/231206/starcraft/protoss/interface/protoss.dart';

class Zealot extends Protoss implements MedicCurable {
  @override
  double hp;

  Zealot({required super.shield, required this.hp});
}