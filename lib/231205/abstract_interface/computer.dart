import 'package:dart_basic/231205/abstract_interface/interface/thing.dart';

import 'interface/tangible_asset.dart';
import 'patent.dart';

class Computer extends TangibleAsset implements Thing {
  int price;
  String color;
  String makerName;
  double _weight;

  @override
  double get weight => _weight;

  @override
  set weight(double weight) {
    _weight = weight;
  }

  Computer({
    required Patent patent,
    required String name,
    required this.price,
    required double weight,
    required this.color,
    required this.makerName,
  })  : _weight = weight,
        super(patent, name);
}
