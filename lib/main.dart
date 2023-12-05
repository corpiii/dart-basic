import '231205/abstract_interface/book.dart';
import '231205/abstract_interface/computer.dart';
import '231205/abstract_interface/patent.dart';

void main(List<String> args) {
  var computer = Computer(
      patent: Patent(),
      name: 'computer',
      price: 123,
      color: 'color',
      makerName: 'apple');

  var book = Book(
      patent: Patent(),
      name: '책',
      price: 123,
      color: 'color',
      isbn: 'isbn');
}
