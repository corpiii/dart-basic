import 'package:dart_basic/231206/starcraft/interface/army_unionable.dart';
import '../../interface/protoss.dart';

abstract class ProtossUnit extends Protoss implements ArmyUnionable {
  int hp;
  int shield;

  ProtossUnit({
    required this.hp,
    required this.shield,
  });
}
