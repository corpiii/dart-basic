import 'package:dart_basic/231205/abstract_interface/interface/thing.dart';

import 'patent.dart';
import 'interface/tangible_asset.dart';

class Book extends TangibleAsset implements Thing {
  int price;
  String color;
  String isbn;
  double _weight;

  @override
  double get weight => _weight;

  @override
  set weight(double weight) {
    _weight = weight;
  }

  Book({
    required Patent patent,
    required String name,
    required this.price,
    required double weight,
    required this.color,
    required this.isbn,
  })  : _weight = weight,
        super(patent, name);
}

