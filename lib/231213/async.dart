import 'dart:async';
import 'dart:convert';
import 'dart:io';

void processFile() async {
  // 1
  File csvFile = File('lib/231213/sample.csv');
  String allString = await csvFile.readAsString();
  changeWord(csvFile, allString);

  // 2
  getMovieInfo()
  .then((value) {
    Map<String, dynamic> map = jsonDecode(value);
    print(map['director']);
  });

  // 3
  try {
    String result = await timeoutFuture().timeout(Duration(seconds: 5));
    print(result);
  } on TimeoutException {
    print('timeout');
  }
}

void changeWord(File csvFile, String str) async {
  var newString = str.replaceAll('한석봉', '김석봉');
  print(newString);
  await csvFile.writeAsString(newString);
}

Future<String> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));
  final mockData = {
    'title' : 'star Wars',
    'director' : 'George Lucas',
    'year' : 1977,
  };
  return jsonEncode(mockData);
}

Future<String> timeoutFuture() async {
  await Future.delayed(Duration(seconds: 6));
  return 'ok';
}
