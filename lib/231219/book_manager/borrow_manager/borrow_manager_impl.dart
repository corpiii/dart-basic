import 'package:dart_basic/231219/book_manager/borrow_manager/interface/book_borrow_manager.dart';
import 'package:dart_basic/231219/book_manager/model/book.dart';
import 'package:dart_basic/231219/book_manager/model/borrow_info.dart';
import 'package:dart_basic/231219/book_manager/model/borrow_state.dart';
import 'package:dart_basic/231219/book_manager/model/user.dart';

import '../model/borrow_history.dart';

typedef UserId = int;

class BorrowManagerImpl implements BorrowManager {
  static const _limitBorrowDays = 14;
  static const _limitRenewDays = 7;

  List<Book> _totalBookList = [];
  List<BorrowInfo> _borrowedBooks = [];
  List<BorrowHistory> _borrowArchive = [];

  BorrowManagerImpl({
    required List<Book> bookList,
    required List<BorrowInfo> borrowHistory,
  })  : _totalBookList = bookList,
        _borrowedBooks = borrowHistory;

  @override
  DateTime borrowBook(User user, Book book) {
    DateTime now = DateTime.now();
    DateTime borrowDate = DateTime(now.year, now.month, now.day);
    DateTime returnDate = borrowDate.add(Duration(days: _limitBorrowDays));

    _addBorrowInfo(borrowDate, returnDate, book, user);
    _addBorrowHistory(borrowDate, BorrowState.borrowed, book, user);

    return returnDate;
  }

  @override
  List<Book> getAllCanBorrowBooks() {
    return _totalBookList
        .where((element) => element.isBorrowed == false)
        .toList();
  }

  @override
  void printBorrowArchive() {
    _borrowArchive.forEach(print);
  }

  @override
  List<BorrowInfo> getBorrowedBookBy(int userId) {
    return _borrowedBooks
        .where((element) => element.borrower.id == userId)
        .toList();
  }

  @override
  bool renewBook(User user, Book book) {
    var borrowedBook = _borrowedBooks
        .where((element) => element.borrowedBook == book)
        .singleOrNull;

    if (borrowedBook == null || borrowedBook.isRenew == true) {
      return false;
    }

    borrowedBook.isRenew = true;
    borrowedBook.returnDate = borrowedBook.returnDate.add(Duration(days: _limitRenewDays));

    DateTime now = DateTime.now();
    DateTime currentDate = DateTime(now.year, now.month, now.day);
    _addBorrowHistory(currentDate, BorrowState.renewed, book, user);

    return true;
  }

  @override
  void returnBook(User user, Book book) {
    book.isBorrowed = false;
    _borrowedBooks = _borrowedBooks
        .where((element) => element.borrowedBook != book)
        .toList();

    DateTime now = DateTime.now();
    DateTime currentDate = DateTime(now.year, now.month, now.day);

    _addBorrowHistory(currentDate, BorrowState.returned, book, user);
  }

  void _addBorrowInfo(
      DateTime borrowDate, DateTime returnDate, Book book, User user) {
    BorrowInfo info = BorrowInfo(
        borrowDate: borrowDate,
        returnDate: returnDate,
        borrowedBook: book,
        borrower: user);

    book.isBorrowed = true;
    _borrowedBooks.add(info);
  }

  void _addBorrowHistory(
      DateTime currentDate, BorrowState state, Book book, User user) {
    BorrowHistory history = BorrowHistory(
        currentDate: currentDate, state: state, book: book, user: user);
    _borrowArchive.add(history);
  }
}
