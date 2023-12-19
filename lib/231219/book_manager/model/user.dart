class User {
  static int _incresedId = 0;

  int _id;
  String _name;
  String _address;
  String _phoneNumber;
  DateTime _birthDay;
  int _gender;

  User({
    required String name,
    required int gender,
    required String address,
    required String phoneNumber,
    required DateTime birthDay,
  })  : _id = _incresedId,
        _name = name,
        _gender = gender,
        _address = address,
        _phoneNumber = phoneNumber,
        _birthDay = birthDay {
    _incresedId += 1;
  }

  @override
  String toString() {
    return 'User(name=$_name, id=$_id, gender=$_gender)';
  }
}