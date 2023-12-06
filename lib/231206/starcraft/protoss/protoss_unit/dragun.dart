import 'interface/protoss_unit.dart';
import '../../interface/scv_repairable.dart';

class Dragun extends ProtossUnit implements SCVRepairable {
  Dragun({
    required super.hp,
    required super.shield,
  });
}
