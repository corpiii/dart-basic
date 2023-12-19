import 'package:dart_basic/231219/book_manager/book_manager.dart';
import 'package:dart_basic/231219/book_manager/borrow_manager/borrow_manager_impl.dart';
import 'package:dart_basic/231219/book_manager/user_manager/user_manager_impl.dart';

void main() {
  var borrowManager = BorrowManagerImpl();
  var userManager = UserManagerImpl();

  BookManager bookManager =
      BookManager(
        borrowManager: borrowManager,
        userManager: userManager
      );

  bookManager.start();
}