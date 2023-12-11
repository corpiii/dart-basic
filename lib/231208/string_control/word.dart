class Word {
  String _word;

  Word({required String word}) : _word = word;

  bool isVowel(int i) {
    final subString = _word.substring(i, i + 1);

    switch (subString) {
      case 'a':
      case 'e':
      case 'i':
      case 'o':
      case 'u':
        return true;
      default:
        return false;
    }
  }

  bool isConsonant(int i) {
    final subString = _word.substring(i, i + 1);

    switch (subString) {
      case 'a':
      case 'e':
      case 'i':
      case 'o':
      case 'u':
        return false;
      default:
        return true;
    }
  }
}