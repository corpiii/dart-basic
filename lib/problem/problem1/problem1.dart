// 1. 여긴어디.

import 'dart:io';

void problem1() {
  (int, int, int) firstLine = inputFirstLine();
  var w = firstLine.$1;
  var h = firstLine.$2;
  var n = firstLine.$3;

  (int, int) secondLine = inputSecondLine();
  var x = secondLine.$1;
  var y = secondLine.$2;

  List<(String, int)> movement = [];
  for (var i = 0; i < n; i++) {
    (String, int) movementLine = inputMovementLine();
    movement.add(movementLine);
  }

  final result = move((w, h), (x, y), movement);
  print("${result.$1} ${result.$2}");
}

(int, int, int) inputFirstLine() {
  List<String> input = stdin.readLineSync()!.split(' ');
  var parseInput = input.map((e) => int.parse(e)).toList();
  return (parseInput[0], parseInput[1], parseInput[2]);
}

(int, int) inputSecondLine() {
  List<String> input = stdin.readLineSync()!.split(' ');
  var parseInput = input.map((e) => int.parse(e)).toList();
  return (parseInput[0], parseInput[1]);
}

(String, int) inputMovementLine() {
  List<String> input = stdin.readLineSync()!.split(' ');
  return (input[0], int.parse(input[1]));
}

(int, int) move((int, int) boardSize, (int, int) initPosition, List<(String, int)> movement) {
  var x = initPosition.$1;
  var y = initPosition.$2;

  for (var move in movement) {
    final direction = move.$1;
    final distance = move.$2;

    switch (direction) {
      case "U":
        y += distance;
        break;
      case "D":
        y -= distance;
        break;
      case "R":
        x += distance;
        break;
      case "L":
        x -= distance;
        break;
    }

    if (x < 0) {
      while (x < 0) {
        x += boardSize.$1;
      }
    } else if (x > boardSize.$1) {
      while (x > boardSize.$1) {
        x -= boardSize.$1;
      }
    }

    if (y < 0) {
      while (y < 0) {
        y += boardSize.$2;
      }
    } else if (y > boardSize.$2) {
      while (y > boardSize.$2) {
        y -= boardSize.$2;
      }
    }
  }

  return (x, y);
}