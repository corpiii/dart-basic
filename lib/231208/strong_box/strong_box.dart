import 'package:dart_basic/231208/strong_box/key_type.dart';

class StrongBox<Element> {
  static const _initKeyCount = 0;

  Map<KeyType, int> _useKeyCount = {
    KeyType.padlock : _initKeyCount,
    KeyType.button : _initKeyCount,
    KeyType.dial : _initKeyCount,
    KeyType.finger : _initKeyCount,
  };

  KeyType _keyType;
  Element? _element;

  void put(Element element, KeyType keyType) {
    print('Initialize Box. KeyType is ${keyType.name}');
    _element = element;
    _keyType = keyType;

    _useKeyCount = { for (var key in _useKeyCount.keys) key : _initKeyCount };
  }

  Element? get() {
    if (_element == null) {
      print('Empty Box. Put in something');

      return null;
    }

    _useKeyCount[_keyType] = _useKeyCount[_keyType]! + 1;

    if (_useKeyCount[_keyType] == _keyType.limitCount) {
      print('Open the Box by $KeyType. Inner value is $_element');

      _useKeyCount[_keyType] = _initKeyCount;
      _element = null;

      return _element;
    }

    final remainCount = _keyType.limitCount - _useKeyCount[_keyType]!;
    print('Not yet. More try open $remainCount');

    return null;
  }

  StrongBox({
    required Element element,
    required KeyType keyType,
  })  : _element = element,
        _keyType = keyType {
    put(element, keyType); // ?
  }
}



// Generic을 num, String, List<T> 3개를 지원하는 것은 불가능.
// List인 것을 검사해서 as List로 바꿀 경우, List<dynamic>이 됨.
// 이 다이나믹을 Element로 변경해주면 되는데

/// 이게 불가능해서 안됨.
/// List<dynamic> list3 = [1,2,3];
/// final list4 = list3 as List<int>; // error
/// print(list4);

// num, String의 경우 는 지원 가능.
// constant 한 애들만 지원 가능.
// constant 한 것을 어떻게 체크할 수 있을까?
// 불가능.
