import 'package:dart_basic/231219/book_manager/borrow_manager/extension/date_format+.dart';

import 'book.dart';
import 'user.dart';

class BorrowInfo {
  DateTime borrowDate;
  DateTime returnDate;
  Book borrowedBook;
  User borrower;
  bool isRenew;

  BorrowInfo({
    required this.borrowDate,
    required this.returnDate,
    required this.borrowedBook,
    required this.borrower,
    this.isRenew = false
  });

  @override
  String toString() {
    return '제목: ${borrowedBook.title}, 빌린날짜: ${borrowDate.yyyyMMdd}, '
        '반납기한: ${returnDate.yyyyMMdd}, 빌린사람: ${borrower.name}, 연장여부: $isRenew';
  }
}
