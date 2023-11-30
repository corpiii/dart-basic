class VendingMachine {
  Map<String, List<int>> menu = {
    'chocolate' : [500, 5],
    'ppeppero' : [600, 5],
    'fanta' : [1000, 5],
    'cider' : [1100, 5],
  };

  Map<String, String> menuTranslator = {
    "chocolate" : "초콜릿",
    "ppeppero" : "빼빼로",
    "fanta" : "환타",
    "cider" : "사이다",
  };

  void order({required String name, required int money}) {
    var beverageInfo = menu[name];

    if (beverageInfo == null) {
      print("이름을 확인해주세요");
      return;
    }

    final price = beverageInfo[0];

    if (money < price) {
      print("금액이 부족합니다.");
      return;
    }

    if (beverageInfo[1] > 0) {
      final translateName = menuTranslator[name];
      beverageInfo[1] -= 1;

      print("[$translateName 구매 성공] 가격: $price원, 거스름돈: ${money - price}원, 남은 수량: ${beverageInfo[1]}개");
      printBeverageState();
    } else {
      print("재고가 부족합니다");
    }
  }

  void printBeverageState() {
    print('''
===== 자판기 상태 =====
초콜릿 - 가격: ${menu['chocolate']![0]}원, 수량: ${menu['chocolate']![1]}개
빼빼로 - 가격: ${menu['ppeppero']![1]}원, 수량: ${menu['ppeppero']![1]}개
환타 - 가격: ${menu['fanta']![1]}원, 수량: ${menu['fanta']![1]}개
사이다 - 가격: ${menu['cider']![1]}원, 수량: ${menu['cider']![1]}개
======================''');
  }
}