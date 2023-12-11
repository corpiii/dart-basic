import 'dart:convert';
import 'dart:core';
import 'dart:io';

class Employee {
  String name;
  int age;

  Employee({required this.name, required this.age});

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'age': this.age,
    };
  }

  factory Employee.fromJson(Map<String, dynamic> map) {
    return Employee(
      name: map['name'] as String,
      age: map['age'] as int,
    );
  }
}

class Department {
  String name;
  Employee leader;

  Department({required this.name, required this.leader});

  Department.fromJson(Map<String, dynamic> map) :
      name = map['name'] as String,
      leader = Employee.fromJson(map['leader']);

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'leader': this.leader.toJson(),
    };
  }
}

void dateFormat() {
  var department = Department(
      name: '총무부',
      leader: Employee(
          name: '홍길동',
          age: 41
      )
  );

  // object -> json
  String encodedObject = jsonEncode(department);

  // json -> object
  Map<String, dynamic> decodedObject = jsonDecode(encodedObject);
  Department regenerateDepartment = Department.fromJson(decodedObject);

  // file save json
  File companyString = File('lib/231209/company.txt');
  companyString.writeAsStringSync(decodedObject.toString());

  // check object inner property
  print(regenerateDepartment.leader.name); // 홍길동
}