import 'interface/mechanic.dart';

class SCV extends Mechanic {
  void repair(Mechanic mechanic) {
    // todo
  }

  double earn() {
    // todo
    return 0;
  }

  @override
  double hp;

  SCV({required this.hp});
}