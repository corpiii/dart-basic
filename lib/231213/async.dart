import 'dart:io';

void processFile() {
  File csvFile = File('lib/231213/sample.csv');
  String allString = csvFile.readAsStringSync();

  allString = allString.replaceAll('한석봉', '김석봉');
  csvFile.writeAsStringSync(allString);
}