import '../../interface/protoss.dart';

abstract class ProtossBuilding extends Protoss {
  int hp;
  int shield;

  ProtossBuilding({
    required this.hp,
    required this.shield,
  });
}
