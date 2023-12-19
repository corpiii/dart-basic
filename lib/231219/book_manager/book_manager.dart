import 'dart:io';

import 'package:dart_basic/231219/book_manager/borrow_manager/interface/book_borrow_manager.dart';
import 'package:dart_basic/231219/book_manager/model/user_input_processor.dart';
import 'package:dart_basic/231219/book_manager/user_manager/interface/user_manager.dart';

import 'model/user.dart';

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
          _userManager.printAllUser();
          break;
        case 2:
          User user = generateUser();
          _userManager.addUser(user);
          break;
        case 3:
          int id = getUserId();
          User willUpdatedUser = _userManager.findUserById(id);
          print('회원을 수정합니다: $willUpdatedUser');
          User updatedUser = updateUser(willUpdatedUser);
          _userManager.updateUser(updatedUser);
          break;
        case 4:

        default:
          print('잘못된 입력입니다.');
          break;
      }
    }
  }

  User generateUser() {
    UserInputProcessor processor = UserInputProcessor();

    var id = processor.inputUserId();
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

  int getUserId() {
    UserInputProcessor processor = UserInputProcessor();

    var id = processor.inputUserId();

    return id;
  }

  User updateUser(User user) {
    UserInputProcessor processor = UserInputProcessor();

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