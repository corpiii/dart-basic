import '../../../interface/medic_curable.dart';
import '../../../interface/scv_repairable.dart';
import 'interface/mechanic.dart';

class SCV extends Mechanic implements SCVRepairable, MedicCurable {
  SCV({required super.hp});

  void repair(Mechanic mechanic) {
    // todo
  }

  double earn() {
    // todo
    return 0;
  }
}