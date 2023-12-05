import 'patent.dart';
import 'tangible_asset.dart';

class Book extends TangibleAsset {
  int price;
  String color;
  String isbn;

  Book({
    required Patent patent,
    required String name,
    required this.price,
    required this.color,
    required this.isbn,
  }): super(patent, name);
}

