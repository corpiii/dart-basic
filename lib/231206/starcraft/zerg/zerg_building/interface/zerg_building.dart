import '../../interface/zerg.dart';

abstract class ZergBuilding extends Zerg {
  int hp;

  ZergBuilding({required this.hp});
}