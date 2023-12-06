import '../../interface/zerg.dart';

abstract class ZergBuilding implements Zerg {
  int hp;

  ZergBuilding({required this.hp});
}