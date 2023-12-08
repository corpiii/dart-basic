import 'package:dart_basic/231208/key_type.dart';

class StrongBox<Element> {
  static const _initKeyCount = 0;
  static const Map<KeyType, int> _useKeyLimit = {
    KeyType.padlock : 1024,
    KeyType.button : 10000, // 10,000
    KeyType.dial : 30000, // 30,000
    KeyType.finger : 5, // 1,000,000
  };

  Map<KeyType, int> _useKeyCount = {
    KeyType.padlock : _initKeyCount,
    KeyType.button : _initKeyCount,
    KeyType.dial : _initKeyCount,
    KeyType.finger : _initKeyCount,
  };

  KeyType _keyType;
  Element? _element;

  void put(Element element, KeyType keyType) {
    print('Initialize Box. KeyType is $keyType');
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

    if (_useKeyCount[_keyType] == _useKeyLimit[_keyType]) {
      print('Open the Box by $KeyType. Inner value is $_element');

      _useKeyCount[_keyType] = _initKeyCount;
      _element = null;

      return _element;
    }

    final remainCount = _useKeyLimit[_keyType]! - _useKeyCount[_keyType]!;
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

