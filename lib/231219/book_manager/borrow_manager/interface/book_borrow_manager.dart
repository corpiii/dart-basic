import 'package:dart_basic/231219/book_manager/model/borrow_info.dart';

import '../../model/book.dart';
import '../../model/user.dart';

abstract interface class BorrowManager {
  DateTime borrowBook(User user, Book book);
  bool renewBook(User user, Book book);
  void returnBook(User user, Book book);

  List<Book> getAllCanBorrowBooks();
  void printBorrowArchive();
  List<BorrowInfo> getBorrowedBookBy(int id);
}
