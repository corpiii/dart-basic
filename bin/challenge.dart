void challenge369() {
  var result = playGame();
  printResult(result);
}

List<int> playGame() {
  List<int> players = [0, 0, 0, 0];
  List<int> words = [0, 0, 0];
  int nowNumber = 1;

  while (nowNumber <= 100) {
    String comment = '$nowNumber';
    int playerSelector = (nowNumber - 1) % 4;

    switch (judgeClapRoolAhh(nowNumber)) {
      case 'clap':
        players[playerSelector] += 1;
        words[0] += 1;
        comment = 'clap';
        break;
      case 'rool':
        words[1] += 1;
        comment = 'rool';
        break;
      case 'ahh':
        words[2] += 1;
        comment = 'ahh';
        break;
      default:
        break;
    }
    print('Player ${playerSelector + 1}: $comment');
    nowNumber += 1;
  }

  var loserPlayer = judgeMostClapPlayer(players);
  return words + players + [loserPlayer];
}

String judgeClapRoolAhh(int number) {
  if (number % 30 == 0) {
    return 'ahh';
  }

  if (number % 10 == 0) {
    return 'rool';
  }

  if (number % 3 == 0) {
    return 'clap';
  }

  return 'none';
}

int judgeMostClapPlayer(List<int> words) {
  var mostClapPlayer = 0;
  var maxClap = words[0];

  for (int index = 0; index < words.length; index++) {
    if (maxClap < words[index]) {
      maxClap = words[index];
      mostClapPlayer = index;
    }
  }
  return mostClapPlayer + 1;
}

void printResult(List<int> result) {
  print('''

clap의 총 갯수: ${result[0]}
rool의 총 갯수: ${result[1]}
ahh의 총 갯수: ${result[2]}
Player 1: ${result[3]}
Player 2: ${result[4]}
Player 3: ${result[5]}
Player 4: ${result[6]}

가장 많은 clap을 출력한 플레이어: Player ${result[7]}
''');
}
