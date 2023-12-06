import '../../interface/terran_unit.dart';

abstract class Bionic extends TerranUnit {
  int hp;

  Bionic({required this.hp});
}