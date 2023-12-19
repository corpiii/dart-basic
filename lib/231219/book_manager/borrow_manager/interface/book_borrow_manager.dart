import '../../model/book.dart';
import '../../model/user.dart';

abstract interface class BorrowManager {
  DateTime borrowBook(User user, Book book);
  void renewBook(User user, Book book);
  void returnBook(User user, Book book);

  List<Book> getAllCanBorrowBooks();
  void printBorrowArchive();
  List<Book> getBorrowedBookBy(int id);
}
