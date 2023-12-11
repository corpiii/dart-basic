class SomeError implements Exception {
  String message;

  SomeError(this.message);
}

enum AppError {
  notParseToInt;

  Exception get error {
    switch (this) {
      case AppError.notParseToInt:
        return SomeError('int 타입으로 변경할 수 없습니다.');
    }
  }
}

int parseStringToInt(String string) {
  int num;

  try {
    num = int.parse(string);
  } catch(e) {
    throw AppError.notParseToInt.error;
  }

  return num;
}

void parseError() {
  final numString = '변경안됨';
  int num;

  try {
    num = parseStringToInt(numString);
  } on SomeError catch(e) {
    print(e.message); // int 타입으로 변경할 수 없습니다.
    num = 0;
  }

  print(num); // 0
}