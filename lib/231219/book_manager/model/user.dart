class User {
  String _name;
  String _address;
  String _phoneNumber;
  DateTime _birthDay;

  User({
    required String name,
    required String address,
    required String phoneNumber,
    required DateTime birthDay,
  })  : _name = name,
        _address = address,
        _phoneNumber = phoneNumber,
        _birthDay = birthDay;
}