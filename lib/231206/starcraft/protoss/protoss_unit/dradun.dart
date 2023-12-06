import 'package:dart_basic/231206/starcraft/protoss/interface/protoss.dart';
import 'package:dart_basic/231206/starcraft/protoss/protoss_unit/interface/protoss_unit.dart';
import '../../interface/scv_curable.dart';

class Dragun extends ProtossUnit implements SCVCurable {
  @override
  double hp;

  Dragun({
    required this.hp,
    required super.shield,
  });
}
