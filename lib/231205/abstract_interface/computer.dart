import 'package:dart_basic/231205/abstract_interface/thing.dart';

import 'tangible_asset.dart';
import 'patent.dart';

class Computer extends TangibleAsset implements Thing {
  int price;
  String color;
  String makerName;

  @override
  double weight;

  Computer({
    required Patent patent,
    required String name,
    required this.price,
    required this.weight,
    required this.color,
    required this.makerName,
  }) : super(patent, name);


}
