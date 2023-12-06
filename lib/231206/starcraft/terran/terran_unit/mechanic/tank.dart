import '../../../interface/scv_repairable.dart';
import 'interface/mechanic.dart';

class Tank extends Mechanic implements SCVRepairable {
  Tank({required super.hp});
}