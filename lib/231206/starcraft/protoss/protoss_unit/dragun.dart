import 'interface/protoss_unit.dart';
import '../../interface/scv_repairable.dart';

class Dragun extends ProtossUnit implements SCVRepairable {
  @override
  double hp;

  Dragun({
    required this.hp,
    required super.shield,
  });
}
