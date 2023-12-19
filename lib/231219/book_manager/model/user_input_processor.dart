import 'dart:io';

class UserInputProcessor {
  UserInputProcessor._internal();

  static final shared = UserInputProcessor._internal();

  String inputUserName() {
    bool isInvalid = true;
    String name = "";

    while (isInvalid) {
      print('이름을 입력해주세요.');

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

  int inputUserGender() {
    bool isInvalid = true;
    int gender = 0;

    while (isInvalid) {
      print('성별을 입력해주세요.');

      var userInput = stdin.readLineSync();
      if (userInput != null && userInput.isNotEmpty) {
        try {
          gender = int.parse(userInput);
          isInvalid = false;
        } catch(e) {
          print('숫자를 입력해주세요');
        }
      } else {
        print('다시 입력해주세요');
        continue;
      }
    }

    return gender;
  }

  String inputUserAddress() {
    bool isInvalid = true;
    String address = '';

    while (isInvalid) {
      print('주소를 입력해주세요.');

      var userInput = stdin.readLineSync();

      if (userInput != null && userInput.isNotEmpty) {
          address = userInput;
          isInvalid = false;
      } else {
        print('다시 입력해주세요');
        continue;
      }
    }

    return address;
  }

  String inputUserPhoneNumber() {
    bool isInvalid = true;
    String phoneNumber = '';

    while (isInvalid) {
      print('\'-\'을 포함한 휴대폰번호를 입력해주세요. 예) 010-1234-5678');

      var userInput = stdin.readLineSync();

      if (userInput != null && userInput.isNotEmpty) {
        RegExp regex = RegExp(r'^010-\d{4}-\d{4}$');
        if (regex.hasMatch(userInput)) {
          phoneNumber = userInput;
          isInvalid = false;
        } else {
          print('형태가 올바르지 않습니다.');
        }
      } else {
        print('다시 입력해주세요');
        continue;
      }
    }

    return phoneNumber;
  }

  DateTime inputUserBirthDay() {
    bool isInvalid = true;
    DateTime birthDay = DateTime.now();

    while (isInvalid) {
      print('년,월,일 순서로 \'/\'를 구분자로 생년월일을 입력해주세요 예 ) 2023/12/19');

      var userInput = stdin.readLineSync();

      if (userInput != null && userInput.isNotEmpty) {
        RegExp regex = RegExp(r'^\d{4}/(0?[1-9]|1[0-2])/(0?[1-9]|[12][0-9]|3[01])$');

        if (regex.hasMatch(userInput) == false) {
          print('형태가 올바르지 않습니다.');
          continue;
        }

        List<String> dateParts = userInput.split('/');

        int? year = int.tryParse(dateParts[0]);
        int? month = int.tryParse(dateParts[1]);
        int? day = int.tryParse(dateParts[2]);

        if (year == null || month == null || day == null) {
          print('숫자를 입력해주세요');
          continue;
        }

        if (month < 1 || month > 12 || day < 1 || day > 31) {
          print('월,일 을 확인해주세요.');
          continue;
        }

        if (month == 2 && day > 29) {
          print('2월은 28일을 초과할 수 없습니다.');
          continue;
        }

        if ((month == 4 || month == 6 || month == 9 || month == 11) && day > 30) {
          print('4, 6, 9, 11월은 30일을 초과할 수 없습니다.');
          continue;
        }

        birthDay = DateTime(year, month, day);
        isInvalid = false;
      } else {
        print('다시 입력해주세요');
        continue;
      }
    }

    return birthDay;
  }

  int inputId() {
    bool isInvalid = true;
    int id = -1;

    while (isInvalid) {
      print('id를 입력해주세요.');

      var userInput = stdin.readLineSync();
      if (userInput != null && userInput.isNotEmpty) {
        try {
          id = int.parse(userInput);
          isInvalid = false;
        } catch(e) {
          print('숫자를 입력해주세요');
        }
      } else {
        print('다시 입력해주세요');
        continue;
      }
    }

    return id;
  }

  int inputBookNumber() {
    bool isInvalid = true;
    int number = -1;

    while (isInvalid) {
      print('책 번호를 입력해주세요.');

      var userInput = stdin.readLineSync();
      if (userInput != null && userInput.isNotEmpty) {
        try {
          number = int.parse(userInput);
          isInvalid = false;
        } catch(e) {
          print('숫자를 입력해주세요');
        }
      } else {
        print('다시 입력해주세요');
        continue;
      }
    }

    return number;
  }
}