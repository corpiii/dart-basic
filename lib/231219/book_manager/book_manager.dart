import 'dart:io';

import 'package:dart_basic/231219/book_manager/borrow_manager/interface/book_borrow_manager.dart';
import 'package:dart_basic/231219/book_manager/user_manager/interface/user_manager.dart';

import 'model/user.dart';

class BookManager {
  static const _initUserInput = -1;

  BorrowManager borrowManager;
  UserManager userManager;

  BookManager({
    required this.borrowManager,
    required this.userManager,
  });

  void start() {
    int userInput = _initUserInput;

    while (userInput != 3) {
      print('1.회원관리   2.도서관리   3.종료');
      try {
        var input = stdin.readLineSync();
        userInput = int.parse(input ?? "");
      } catch(e) {
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

  void _startBorrowManagerScene() {

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
          userManager.printAllUser();
          break;
        case 2:
          User user = generateUser();
          userManager.addUser(user);
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

  User generateUser() {
    print('이름을 입력해주세요.');
    var name = inputUserName();

    print('성별을 입력해주세요.');
    // var gender = stdin.readLineSync();
    var gender = 0;

    print('주소를 입력해주세요.');
    var address = stdin.readLineSync();

    print('\'-\'을 포함한 휴대폰번호를 입력해주세요. 예) 010-1234-5678');
    var phoneNumber = stdin.readLineSync();

    print('년,월,일 순서로 \'/\'를 구분자로 생년월일을 입력해주세요 예 ) 2023/12/19');
    var birthDay = stdin.readLineSync();

    return User(name: '', address: '', gender: 0, phoneNumber: '01055555555', birthDay: DateTime.now());
    // return User(name: name, address: address, phoneNumber: phoneNumber, birthDay: birthDay)
  }

  String inputUserName() {
    bool isInvalid = true;
    String name = "";

    while (isInvalid) {
      var userInput = stdin.readLineSync();
      if (userInput != null && userInput.isNotEmpty) {
        name = userInput;
        isInvalid = false;
      } else {
        print('다시 입력해주세요');
        continue;
      }
    }

    return name;
  }
}