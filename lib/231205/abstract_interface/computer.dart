import 'tangible_asset.dart';
import 'patent.dart';

class Computer extends TangibleAsset{
  int price;
  String color;
  String makerName;

  Computer({
    required Patent patent,
    required String name,
    required this.price,
    required this.color,
    required this.makerName,
  }) : super(patent, name);
}
