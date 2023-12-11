import 'dart:io';

void copy(String source, String target) {
  File inputFile = File(source);
  File outputFile = File(target);

  inputFile.writeAsStringSync('가나다라마바사\n');
  inputFile.writeAsStringSync('아자차카타파하', mode: FileMode.append);

  if (!inputFile.existsSync()) {
    inputFile.createSync();
  }

  if (!outputFile.existsSync()) {
    outputFile.createSync();
  }

  inputFile.copySync(target);
}

