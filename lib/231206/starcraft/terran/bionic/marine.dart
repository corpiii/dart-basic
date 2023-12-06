import 'package:dart_basic/231206/starcraft/interface/medic_curable.dart';

import 'interface/bionic.dart';

class Marine extends Bionic implements MedicCurable {
  @override
  double hp;

  Marine({required this.hp});
}