import 'package:dart_basic/231219/book_manager/borrow_manager/interface/book_borrow_manager.dart';
import 'package:dart_basic/231219/book_manager/model/book.dart';
import 'package:dart_basic/231219/book_manager/model/borrow_info.dart';
import 'package:dart_basic/231219/book_manager/model/user.dart';

class BorrowManagerImpl implements BorrowManager {
  List<Book> _bookList = [];
  List<BorrowInfo> _borrowHistory = [];

  static const _limitBorrowDays = 14;

  BorrowManagerImpl({
    required List<Book> bookList,
  }) : _bookList = bookList;

  @override
  void borrowBook(User user, Book book) {
    DateTime now = DateTime.now();
    DateTime borrowDate = DateTime(now.year, now.month, now.day);
    DateTime returnDate = borrowDate.add(Duration(days: _limitBorrowDays));

    BorrowInfo info = BorrowInfo(
        borrowDate: borrowDate,
        returnDate: returnDate,
        isRetrun: false,
        borrowedBook: book,
        borrower: user);

    _borrowHistory.add(info);
  }

  @override
  void printAllCanBorrowBooks() {
    for(var book in _bookList) {
      print(book);
    }
  }

  @override
  void printHistory(User user) {
    // TODO: implement printHistory
  }

  @override
  void renewBook(User user, Book book) {
    // TODO: implement renewBook
  }
}
