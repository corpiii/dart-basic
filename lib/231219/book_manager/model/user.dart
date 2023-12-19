class User {
  int id;
  String name;
  String address;
  String phoneNumber;
  DateTime birthDay;
  int gender;

  User({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.birthDay,
    required this.gender,
  });

  @override
  String toString() {
    return 'User(name=$name, id=$id, gender=$gender)';
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
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birthDay: birthDay ?? this.birthDay,
      gender: gender ?? this.gender,
    );
  }
}