import '../../model/book.dart';
import '../../model/user.dart';

abstract interface class BorrowManager {
  void borrowBook(User user, Book book);
  void renewBook(User user, Book book);

  void printAllBorrowedBook();
  void printHistory(User user);

  void start();
}
