enum KeyType {
  padlock(limitCount: 1024),
  button(limitCount: 10000), // 10,000
  dial(limitCount: 30000), // 30,000
  finger(limitCount: 100000); // 1,000,000

  final int limitCount;

  const KeyType({required this.limitCount});

  static int limitCountBy(KeyType keyType) => keyType.limitCount;
}