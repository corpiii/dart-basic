import 'dart:io';

import 'package:dart_basic/231219/book_manager/borrow_manager/extension/date_format+.dart';

import 'borrow_manager/interface/book_borrow_manager.dart';
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
          int id = UserInputProcessor.shared.inputId();

          print('id: $id의 회원을 검색합니다.');
          User? willDeletedUser = _userManager.findUserById(id);

          if (willDeletedUser == null) {
            print('회원을 찾을 수 없습니다.');
            continue;
          }

          print('$willDeletedUser 회원을 삭제합니다.');
          _userManager.deleteUser(id);
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
      print('0.뒤로   1.대출목록   2.도서대출   3.도서반납   4.도서연장');
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
          print('대출목록 입니다.');
          break;
        case 2:
          print('대출하시는 분의 id를 입력해주세요');
          int userId = UserInputProcessor.shared.inputId();
          User? findedUser = _userManager.findUserById(userId);

          if (findedUser == null) {
            print('회원을 찾을 수 없습니다.');
            continue;
          }

          print('안녕하세요 ${findedUser.name}님.');
          var canBorrowBooks = _borrowManager.getAllCanBorrowBooks();

          for (var (index, book) in canBorrowBooks.indexed) {
            print('${index + 1}. ${book.title}');
          }

          var selectedBookNumber = UserInputProcessor.shared.inputBookNumber();

          if (selectedBookNumber < 0 ||
              selectedBookNumber >= canBorrowBooks.length) {
            print('잘못된 입력입니다.');
            continue;
          }

          var returnDate = _borrowManager.borrowBook(
              findedUser, canBorrowBooks[selectedBookNumber - 1]);

          print('대출기한은 ${returnDate.yyyyMMdd} 입니다.');

          break;
        case 3:
        case 4:
        default:
          print('잘못된 입력입니다.');
          break;
      }
    }
  }
}
