import 'package:dart_basic/231206/starcraft/interface/medic_curable.dart';
import 'interface/bionic.dart';

class Medic extends Bionic {
  Medic({required this.hp});

  void heal(MedicCurable unit) {
    unit.hp += 10;
  }

  @override
  double hp;
}