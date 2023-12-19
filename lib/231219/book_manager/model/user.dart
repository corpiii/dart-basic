class User {
  int _id;
  String _name;
  String _address;
  String _phoneNumber;
  DateTime _birthDay;
  int _gender;

  int get id => _id;

  User({
    required int id,
    required String name,
    required int gender,
    required String address,
    required String phoneNumber,
    required DateTime birthDay,
  })  : _id = id,
        _name = name,
        _gender = gender,
        _address = address,
        _phoneNumber = phoneNumber,
        _birthDay = birthDay;

  @override
  String toString() {
    return 'User(name=$_name, id=$_id, gender=$_gender)';
  }

  User copyWith({
    int? id,
    String? name,
    String? address,
    String? phoneNumber,
    DateTime? birthDay,
    int? gender,
  }) {
    return User(
      id: id ?? this._id,
      name: name ?? this._name,
      address: address ?? this._address,
      phoneNumber: phoneNumber ?? this._phoneNumber,
      birthDay: birthDay ?? this._birthDay,
      gender: gender ?? this._gender,
    );
  }
}