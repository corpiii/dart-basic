import 'package:dart_basic/231219/book_manager/borrow_manager/interface/book_borrow_manager.dart';
import 'package:dart_basic/231219/book_manager/model/book.dart';
import 'package:dart_basic/231219/book_manager/model/borrow_info.dart';
import 'package:dart_basic/231219/book_manager/model/user.dart';

class BorrowManagerImpl implements BorrowManager {
  static const _limitBorrowDays = 14;

  List<Book> _bookList = [];
  List<BorrowInfo> _borrowHistory = [];

  BorrowManagerImpl({
    required List<Book> bookList,
    required List<BorrowInfo> borrowHistory,
  })  : _bookList = bookList,
        _borrowHistory = borrowHistory;

  @override
  DateTime borrowBook(User user, Book book) {
    DateTime now = DateTime.now();
    DateTime borrowDate = DateTime(now.year, now.month, now.day);
    DateTime returnDate = borrowDate.add(Duration(days: _limitBorrowDays));

    BorrowInfo info = BorrowInfo(
        borrowDate: borrowDate,
        returnDate: returnDate,
        isReturn: false,
        borrowedBook: book,
        borrower: user);

    book.isBorrowed = true;
    _borrowHistory.add(info);

    return returnDate;
  }

  @override
  List<Book> getAllCanBorrowBooks() {
    return _bookList.where((element) => element.isBorrowed == false).toList();
  }

  @override
  void printBorrowHistory() {
    for (var (index, info) in _borrowHistory.indexed) {
      print(info);
    }
  }

  @override
  void renewBook(User user, Book book) {
    // TODO: implement renewBook
  }

  @override
  void returnBook(Book book) {
    // TODO: implement returnBook
  }
}
