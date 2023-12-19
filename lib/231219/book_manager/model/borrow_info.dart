import 'package:dart_basic/231219/book_manager/borrow_manager/extension/date_format+.dart';

import 'book.dart';
import 'user.dart';

class BorrowInfo {
  DateTime borrowDate;
  DateTime returnDate;
  Book borrowedBook;
  User borrower;

  BorrowInfo({
    required this.borrowDate,
    required this.returnDate,
    required this.borrowedBook,
    required this.borrower,
  });

  @override
  String toString() {
    return '제목: ${borrowedBook.title}, 빌린날짜: ${borrowDate.yyyyMMdd}, '
        '반납기한: ${returnDate.yyyyMMdd}, 빌린사람: ${borrower.name}';
  }
}
