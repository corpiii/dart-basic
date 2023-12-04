class Wand {
  String _name;
  double _power;

  String get name => _name;

  set name(String value) {
    validateNameAndSet(value);
  }

  double get power => _power;

  set power(double value) {
    _power = value;
  }

  Wand({
    required String name,
    required double power,
  })  : _name = name,
        _power = power {
    validateNameAndSet(name);
  }

  void validateNameAndSet(String name) {
    if (name.length >= 3) {
      _name = name;
    } else {
      throw Exception('Name must be at least 3 letters');
    }
  }
}
