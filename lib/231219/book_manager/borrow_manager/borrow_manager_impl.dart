import 'package:dart_basic/231219/book_manager/borrow_manager/interface/book_borrow_manager.dart';
import 'package:dart_basic/231219/book_manager/model/book.dart';
import 'package:dart_basic/231219/book_manager/model/user.dart';

class BorrowManagerImpl implements BorrowManager {
  List<Book> _bookList = [];

  BorrowManagerImpl({
    required List<Book> bookList,
  }) : _bookList = bookList;

  @override
  void borrowBook(User user, Book book) {
    // TODO: implement borrowBook
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