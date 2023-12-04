/// 2 - 1
/// 1) Set - 대한민국의 도시 이름 모음 (순서 상관 없음)
/// 2) Map - 10명 학생의 시험 점수
/// 3) Map - 대한민국의 도시별 인구수 (순서 상관 없음)

void personProblem() {
  List<Person> personList = [];

  var hong = Person(name: '홍길동');
  var han = Person(name: '한석봉');

  personList.add(hong);
  personList.add(han);

  var comment = "";
  for (var person in personList) {
    comment += '${person.name}\n';
  }
  print(comment);
}

class Person {
  String name;

  Person({
    required this.name,
  });
}