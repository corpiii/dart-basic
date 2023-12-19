import 'dart:io';

import 'package:dart_basic/231219/book_manager/borrow_manager/extension/date_format+.dart';

import 'borrow_manager/interface/book_borrow_manager.dart';
import 'model/book.dart';
import 'model/user.dart';
import 'model/user_input_processor.dart';
import 'user_manager/interface/user_manager.dart';

class BookManager {
  static const _initUserInput = -1;

  BorrowManager _borrowManager;
  UserManager _userManager;

  BookManager({
    required BorrowManager borrowManager,
    required UserManager userManager,
  })  : _borrowManager = borrowManager,
        _userManager = userManager;

  void start() {
    int userInput = _initUserInput;

    while (userInput != 3) {
      print('1.회원관리   2.도서관리   3.종료');
      try {
        var input = stdin.readLineSync();
        userInput = int.parse(input ?? "");
      } catch (e) {
        print('숫자를 입력해주세요.');
        continue;
      }
      switch (userInput) {
        case 1:
          _startUserManagerScene();
          break;
        case 2:
          _startBorrowManagerScene();
          break;
        case 3:
          print('종료합니다.');
          break;
        default:
          print('잘못된 입력입니다.');
          break;
      }
    }
  }
}

extension UserManagament on BookManager {
  void _startUserManagerScene() {
    int userInput = BookManager._initUserInput;

    while (userInput != 0) {
      print('0.뒤로   1.회원조회   2.회원등록   3.회원수정   4.회원삭제');
      try {
        var input = stdin.readLineSync();
        userInput = int.parse(input ?? "");
      } catch (e) {
        print('숫자를 입력해주세요.');
        continue;
      }

      switch (userInput) {
        case 0:
          print('이전화면으로 이동합니다.');
          break;
        case 1:
          _userManager.printAllUser();
          break;
        case 2:
          User user = _generateUser();
          _userManager.addUser(user);
          break;
        case 3:
          int id = UserInputProcessor.shared.inputId();

          print('id: $id의 회원을 검색합니다.');
          User? willUpdatedUser = _userManager.findUserById(id);

          if (willUpdatedUser == null) {
            print('회원을 찾을 수 없습니다.');
            continue;
          }

          print('$willUpdatedUser 회원을 수정합니다.');
          User updatedUser = _updateUser(willUpdatedUser);
          _userManager.updateUser(updatedUser);
          break;
        case 4:

        default:
          print('잘못된 입력입니다.');
          break;
      }
    }
  }

  User _generateUser() {
    UserInputProcessor processor = UserInputProcessor.shared;

    var id = processor.inputId();
    var name = processor.inputUserName();
    var gender = processor.inputUserGender();
    var address = processor.inputUserAddress();
    var phoneNumber = processor.inputUserPhoneNumber();
    var birthDay = processor.inputUserBirthDay();

    return User(
      id: id,
      name: name,
      gender: gender,
      address: address,
      phoneNumber: phoneNumber,
      birthDay: birthDay,
    );
  }

  User _updateUser(User user) {
    UserInputProcessor processor = UserInputProcessor.shared;

    var id = user.id;
    var name = processor.inputUserName();
    var gender = processor.inputUserGender();
    var address = processor.inputUserAddress();
    var phoneNumber = processor.inputUserPhoneNumber();
    var birthDay = processor.inputUserBirthDay();

    return User(
      id: id,
      name: name,
      gender: gender,
      address: address,
      phoneNumber: phoneNumber,
      birthDay: birthDay,
    );
  }
}

extension BorrowManagement on BookManager {
  void _startBorrowManagerScene() {
    int userInput = BookManager._initUserInput;

    while (userInput != 0) {
      print('0.뒤로   1.도서대출   2.도서반납   3.도서연장   4.대출반납장부');
      try {
        var input = stdin.readLineSync();
        userInput = int.parse(input ?? "");
      } catch (e) {
        print('숫자를 입력해주세요.');
        continue;
      }

      switch (userInput) {
        case 0:
          print('이전화면으로 이동합니다.');
          break;
        case 1:
          _borrowBookWorkflow();
          break;
        case 2:
          _returnBookWorkflow();
          break;
        case 3:
          break;
        case 4:
          _borrowManager.printBorrowArchive();
          break;
        case 5:
        default:
          print('잘못된 입력입니다.');
          break;
      }
    }
  }

  void _borrowBookWorkflow() {
    var canBorrowBooks = _borrowManager.getAllCanBorrowBooks();

    print('대출하시는 분의 id를 입력해주세요');
    int userId = UserInputProcessor.shared.inputId();
    User? borrower = _userManager.findUserById(userId);

    if (borrower == null) {
      print('회원을 찾을 수 없습니다.');
      return;
    }

    print('안녕하세요 ${borrower.name}님.');
    _printCanBorrowBooks(canBorrowBooks);

    var selectedBookNumber =
    UserInputProcessor.shared.inputBookNumber(canBorrowBooks.length);
    var borrowedBook = canBorrowBooks[selectedBookNumber - 1];
    var returnDate = _borrowManager.borrowBook(borrower, borrowedBook);

    print('대출되었습니다. 반납일은 ${returnDate.yyyyMMdd} 까지 입니다.');
  }

  void _printCanBorrowBooks(List<Book> books) {
    for (var (index, book) in books.indexed) {
      print('${index + 1}. ${book.title}');
    }
  }

  void _returnBookWorkflow() {
    var processor = UserInputProcessor.shared;

    print('반납하시는 분의 id를 입력해주세요');
    int userId = processor.inputId();
    User? borrower = _userManager.findUserById(userId);

    if (borrower == null) {
      print('회원을 찾을 수 없습니다.');
      return;
    }

    print('안녕하세요 ${borrower.name}님.');

    var borrowedBooks = _borrowManager.getBorrowedBookBy(borrower.id);
    printBorrowedBooks(borrowedBooks);

    var selectedBookNumber = processor.inputBookNumber(borrowedBooks.length);
    var borrowedBook = borrowedBooks[selectedBookNumber - 1];

    _borrowManager.returnBook(borrower, borrowedBook);
    print('정상적으로 반납되었습니다. 감사합니다.');
  }

  void printBorrowedBooks(List<Book> books) {
    for (var (index, book) in books.indexed) {
      print('${index + 1}. ${book.title}');
    }
  }
}
