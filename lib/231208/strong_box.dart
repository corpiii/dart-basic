import 'package:dart_basic/231208/key_type.dart';

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

    if (_useKeyCount[_keyType] == KeyType.limitCountBy(_keyType)) {
      print('Open the Box by $KeyType. Inner value is $_element');

      _useKeyCount[_keyType] = _initKeyCount;
      _element = null;

      return _element;
    }

    final remainCount = KeyType.limitCountBy(_keyType) - _useKeyCount[_keyType]!;
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



