import 'dart:io';

import 'package:dart_basic/231219/book_manager/borrow_manager/interface/book_borrow_manager.dart';
import 'package:dart_basic/231219/book_manager/user_manager/interface/user_manager.dart';

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

  void _startUserManagerScene() {
    
  }

  void _startBorrowManagerScene() {

  }
}