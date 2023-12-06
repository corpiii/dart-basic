import 'package:dart_basic/231206/starcraft/protoss/protoss_unit/interface/protoss_unit.dart';
import '../../interface/scv_repairable.dart';

class Dragun extends ProtossUnit implements SCVRepairable {
  @override
  double hp;

  Dragun({
    required this.hp,
    required super.shield,
  });
}
