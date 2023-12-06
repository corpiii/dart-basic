import 'package:dart_basic/231206/starcraft/protoss/interface/protoss.dart';
import '../../interface/scv_curable.dart';

class Dragun extends Protoss implements SCVCurable {
  @override
  double hp;

  Dragun({
    required this.hp,
    required super.shield,
  });
}
