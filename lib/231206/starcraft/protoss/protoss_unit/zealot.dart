import 'package:dart_basic/231206/starcraft/interface/army_unionable.dart';
import 'package:dart_basic/231206/starcraft/interface/medic_curable.dart';
import 'package:dart_basic/231206/starcraft/protoss/interface/protoss.dart';

class Zealot extends Protoss implements MedicCurable, ArmyUnionable {
  @override
  double hp;

  Zealot({required super.shield, required this.hp});
}