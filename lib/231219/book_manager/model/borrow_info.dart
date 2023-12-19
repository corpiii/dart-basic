
import 'book.dart';
import 'user.dart';

class BorrowInfo {
  DateTime borrowDate;
  DateTime returnDate;
  bool isRetrun;

  Book borrowedBook;
  User borrower;

  BorrowInfo({
    required this.borrowDate,
    required this.returnDate,
    required this.isRetrun,
    required this.borrowedBook,
    required this.borrower,
  });
}