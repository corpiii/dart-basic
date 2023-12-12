import 'package:collection/collection.dart';

class Trader {
  String name;
  String city;

  Trader(this.name, this.city);

  @override
  String toString() {
    return 'Trader{name: $name, city: $city}';
  }
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);

  @override
  String toString() {
    return 'Transaction{trader: $trader, year: $year, value: $value}\n';
  }
}

final transactions = [
  Transaction(Trader("Brian", "Cambridge"), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
  Transaction(Trader("Mario", "Milan"), 2012, 710),
  Transaction(Trader("Mario", "Milan"), 2012, 700),
  Transaction(Trader("Alan", "Cambridge"), 2012, 950),
];

void query() {
  query1();
  query2();
  query3();
  query4();
  query5();
  query6();
  query7();
  query8();
}

void query1() {
  int targetYear = 2011;
  String result = '';

  result = transactions
      .where((element) => element.year == targetYear)
      .toList()
      .sorted((a, b) => a.value.compareTo(b.value))
      .toString();

  print(result);
  // [Transaction{trader: Trader{name: Brian, city: Cambridge}, year: 2011, value: 300}
  // , Transaction{trader: Trader{name: Raoul, city: Cambridge}, year: 2011, value: 400}
  // ]
}

void query2() {
  List<String> workingCities = transactions
      .map((e) => e.trader.city)
      .toSet()
      .toList();

  print(workingCities); // [Cambridge, Milan]
}

void query3() {
  final targetCity = 'Cambridge';

  List<String> targetCityWorkers = transactions
      .where((element) => element.trader.city == targetCity)
      .map((e) => e.trader.name)
      .toSet()
      .sorted((a, b) => a.compareTo(b));

  print(targetCityWorkers); // [Alan, Brian, Raoul]
}

void query4() {
  List<String> workers = transactions
      .map((e) => e.trader.name)
      .toSet()
      .sorted((a, b) => a.compareTo(b));

  print(workers); // [Alan, Brian, Mario, Raoul]
}

void query5() {
  final targetCity = 'Milan';

  bool isExistWorkerInMilan = transactions
      .where((element) => element.trader.city == targetCity)
      .isNotEmpty;

  print(isExistWorkerInMilan); // true
}

void query6() {
  final targetCity = 'Cambridge';

  List<Transaction> workers = transactions
      .where((element) => element.trader.city == targetCity)
      .toList();

  print(workers);
  // [Transaction{trader: Trader{name: Brian, city: Cambridge}, year: 2011, value: 300}
  // , Transaction{trader: Trader{name: Raoul, city: Cambridge}, year: 2012, value: 1000}
  // , Transaction{trader: Trader{name: Raoul, city: Cambridge}, year: 2011, value: 400}
  // , Transaction{trader: Trader{name: Alan, city: Cambridge}, year: 2012, value: 950}
  // ]
}

void query7() {
  int maxValue = transactions
      .map((e) => e.value)
      .max;

  print(maxValue); // 1000
}

void query8() {
  int minValue = transactions
      .map((e) => e.value)
      .min;

  print(minValue); // 300
}
