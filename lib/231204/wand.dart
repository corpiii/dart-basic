class Wand {
  String _name;
  double _power;

  String get name => _name;

  set name(String value) {
    validateNameAndSet(value);
  }

  double get power => _power;

  set power(double value) {
    validatePowerAndSet(value);
  }

  Wand({
    required String name,
    required double power,
  })  : _name = name,
        _power = power {
    validateNameAndSet(name);
    validatePowerAndSet(power);
  }

  void validateNameAndSet(String name) {
    if (name.length >= 3) {
      _name = name;
    } else {
      throw Exception('\'name\' must be at least 3 letters');
    }
  }

  void validatePowerAndSet(double power) {
    if (0.5 <= power && power <= 100.0) {
      _power = power;
    } else {
      throw Exception('\'power\' must be between 0.5 and 100.0.');
    }
  }
}
