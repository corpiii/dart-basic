import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dart_basic/231214/pharmacy.dart';
import 'package:http/http.dart' as http;

import 'movie_detail.dart';
import 'movie_info.dart';

var base = 'jsonplaceholder.typicode.com';


void jsonExercise() {
  // jsonExercise1();
  // jsonExercise2();

  // printMovieInfo();
  // printMovieDetail();
  // downloadImage();
  // downloadImageParallel();
  searchMask();
}

Future<http.Response> get(String base, String path, [Map<String, dynamic>? parameter]) async {
  var url = Uri.https(base, path, parameter);
  var response = await http.get(url);

  return response;
}

// 연습 1
void jsonExercise1() async {
  var id = 1;
  var path = '/todos/$id';
  var response = await get(base, path);
  var decodedBody = jsonDecode(response.body);

  // delectus aut autem
  print('실습1\n영화 id:$id 의 제목은 ${decodedBody['title']} 입니다.');
}

// 연습 2
void jsonExercise2() async {
  var path = '/todos';
  var response = await get(base, path);
  List<dynamic> decodedBody = jsonDecode(response.body);

  var result = '';
  for (var element in decodedBody) {
    result += '${element['title']}\n';
  }
  print('실습2 영화 리스트:\n$result');
}

var base2 = 'api.themoviedb.org';

// 연습문제 1
void printMovieInfo() async {
  var path = '3/movie/upcoming';
  var parameter = {
    'api_key' : 'a64533e7ece6c72731da47c9c8bc691f',
    'language' : 'ko-KR',
    'page' : '1',
  };

  var response = await get(base2, path, parameter);
  var decodedBody = jsonDecode(response.body);
  var model = MovieInfo.fromJson(decodedBody);

  print(model.toJson());
}

// 연습문제 2
void printMovieDetail() async {
  var movieID = 901362;
  var path = '3/movie/$movieID';
  var parameter = {
    'api_key' : 'a64533e7ece6c72731da47c9c8bc691f',
    'language' : 'ko-KR',
    'page' : '1',
  };

  var response = await get(base2, path, parameter);
  var decodedBody = jsonDecode(response.body);
  var model = MovieDetail.fromJson(decodedBody);

  print(model.toJson());
}

// 연습문제 3, 4
Future<void> downloadImage() async {
  var base = 'alimipro.com';
  var path = 'favicon.ico';
  var url = Uri.https(base, path);

  print('다운로드 시작');
  var stopWatch = Stopwatch();
  stopWatch.start();

  var uint8Data = await _downloadImage(url);
  stopWatch.stop();
  print('다운로드 끝');
  print('=========');
  print('소요시간 : ${stopWatch.elapsed}');
  print('용량 : ${uint8Data.lengthInBytes}bytes');

  // 연습문제 6
  try {
    await _saveFile(uint8Data, 'icon.ico');
  } on PathNotFoundException {
    print('파일위치를 찾을 수 없습니다.');
  }
}

Future<Uint8List> _downloadImage(Uri url) async {
  var response = await http.get(url);

  return response.bodyBytes;
}

Future<void> _saveFile(Uint8List bytes, String fileName) async {
  try {
    File newImage = File('lib/231214/$fileName');
    await newImage.writeAsBytes(bytes);
  } on PathNotFoundException {
    rethrow;
  }
}

// 연습문제 5
void downloadImageParallel() async {
  var stopWatch = Stopwatch();
  var result = '';

  result += '병렬 소요시간 : ';
  stopWatch.start();
  downloadImage();
  downloadImage();
  downloadImage();
  stopWatch.stop();
  result += '${stopWatch.elapsed}\n';

  stopWatch.reset();

  result += '순차 소요시간 : ';
  stopWatch.start();
  await downloadImage();
  await downloadImage();
  await downloadImage();
  stopWatch.stop();
  result += '${stopWatch.elapsed}\n';

  print(result);
  // 병렬 소요시간 : 0:00:00.013967
  // 순차 소요시간 : 0:00:00.182834
}

// 연습문제 7
void searchMask() async {
  var url = Uri.parse('http://104.198.248.76:3000/mask');
  var response = await http.get(url);
  var bodyBytes = response.bodyBytes;
  var json = jsonDecode(utf8.decode(bodyBytes));

  var pharmacy = Pharmacy.fromJson(json);
  var stores = pharmacy.stores;

  for (var store in stores) {
    var elements = [
      store.name, store.addr, store.code,
      store.createdAt, store.lat, store.lng,
      store.remainStat, store.stockAt, store.type
    ];

    var isValid = true;

    for (var element in elements) {
      if (element == null) {
        isValid = false;
        break;
      }
    }

    if (isValid == true) {
      print(store);
    }
  }
}