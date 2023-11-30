// 자판기 알고리즘을 구현
import 'package:dart_basic/problem/problem2/vending_machine.dart';

void problem2() {
  var beverageVendingMachine = VendingMachine();
  beverageVendingMachine.printBeverageState();
  beverageVendingMachine.order(name: "ppeppero", money: 5000);
}