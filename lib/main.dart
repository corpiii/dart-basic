import 'package:dart_basic/231208/key_type.dart';
import 'package:dart_basic/231208/strong_box.dart';

void main(List<String> args) {
  var strongBox = StrongBox(element: '1', keyType: KeyType.finger);

  for (var i = 0; i < 10; i++) {
    strongBox.get();
  }
}