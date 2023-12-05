import 'patent.dart';
import 'tangibleAsset.dart';

class Book extends TangibleAsset {
  String name;
  int price;
  String color;
  String isbn;

  Book({
    required Patent patent,
    required this.name,
    required this.price,
    required this.color,
    required this.isbn,
  }): super(patent);
}

