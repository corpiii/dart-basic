import 'package:dart_basic/231219/book_manager/borrow_manager/extension/date_format+.dart';

import 'book.dart';
import 'borrow_state.dart';
import 'user.dart';

class BorrowHistory {
  DateTime currentDate;
  BorrowState state;
  User user;
  Book book;

  BorrowHistory({
    required this.currentDate,
    required this.state,
    required this.user,
    required this.book,
  });

  @override
  String toString() {
    return '상태: ${state.description}, 일시: ${currentDate.yyyyMMdd}, '
        '책 제목: ${book.title}, 회원: ${user.name}';
  }
}
