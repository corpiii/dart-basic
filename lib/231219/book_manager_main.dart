import 'package:dart_basic/231219/book_manager/book_manager.dart';
import 'package:dart_basic/231219/book_manager/borrow_manager/borrow_manager_impl.dart';
import 'package:dart_basic/231219/book_manager/model/book.dart';
import 'package:dart_basic/231219/book_manager/user_manager/user_manager_impl.dart';

void main() {
  var bookList = [
    Book(id: 1, title: '오준석의 생존코딩', publishDate: DateTime(2021, 1, 1)),
    Book(id: 2, title: '유지보수 어렵게 하는 법', publishDate: DateTime(2022, 10, 10)),
    Book(id: 3, title: '클린코드', publishDate: DateTime(1950, 2, 2)),
    Book(id: 4, title: '객체지향의 사실과 오해', publishDate: DateTime(2002, 8, 8)),
  ];

  var borrowManager = BorrowManagerImpl(bookList: bookList, borrowHistory: []);
  var userManager = UserManagerImpl();

  BookManager bookManager =
      BookManager(
        borrowManager: borrowManager,
        userManager: userManager
      );

  bookManager.start();
}