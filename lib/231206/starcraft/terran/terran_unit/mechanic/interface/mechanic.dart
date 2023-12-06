import '../../interface/terran_unit.dart';

abstract class Mechanic extends TerranUnit {
  int hp;

  Mechanic({required this.hp});
}
