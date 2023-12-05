import 'package:dart_basic/231205/abstract_interface/interface/thing.dart';

import 'patent.dart';
import 'interface/tangible_asset.dart';

class Book extends TangibleAsset implements Thing {
  int price;
  String color;
  String isbn;

  @override
  double weight;

  Book({
    required Patent patent,
    required String name,
    required this.price,
    required this.weight,
    required this.color,
    required this.isbn,
  }): super(patent, name);
}

