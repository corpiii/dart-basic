class Character {
  int _health;
  int _attack;
  int _defense;

  int get health => _health;
  int get attack => _attack;
  int get defense => _defense;

  Character({
    required int health,
    required int attack,
    required int defense})
      : _health = health,
        _attack = attack,
        _defense = defense;

  int calculateAttackDamage(Character target) {
    return attack - target.defense;
  }

  void damagedBy(int damage) {
    _health -= damage;
  }
}