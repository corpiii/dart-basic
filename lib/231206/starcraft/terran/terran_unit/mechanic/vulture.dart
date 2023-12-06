import '../../../interface/scv_repairable.dart';
import 'interface/mechanic.dart';

class Vulture extends Mechanic implements SCVRepairable {
  Vulture({required super.hp});
}