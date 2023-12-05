import 'tangibleAsset.dart';
import 'patent.dart';

class Computer extends TangibleAsset{
  String name;
  int price;
  String color;
  String makerName;

  Computer({
    required Patent patent,
    required this.name,
    required this.price,
    required this.color,
    required this.makerName,
  }) : super(patent);
}
