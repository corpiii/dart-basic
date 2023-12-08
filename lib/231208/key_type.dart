enum KeyType {
  padlock(limitCount: 1024),
  button(limitCount: 10000),
  dial(limitCount: 30000),
  finger(limitCount: 100000);

  final int limitCount;

  static int limitCountBy(KeyType keyType) => keyType.limitCount;
  
  const KeyType({required this.limitCount});
}