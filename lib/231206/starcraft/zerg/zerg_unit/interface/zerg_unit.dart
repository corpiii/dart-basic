import 'package:dart_basic/231206/starcraft/zerg/interface/zerg.dart';
import '../../../interface/army_unionable.dart';

abstract class ZergUnit implements Zerg, ArmyUnionable {
  int hp;

  ZergUnit({required this.hp});
}