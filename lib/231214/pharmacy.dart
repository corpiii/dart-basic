class Pharmacy {
  int count;
  List<Store> stores;

  Pharmacy({
    required this.count,
    required this.stores,
  });

  factory Pharmacy.fromJson(Map<String, dynamic> json) {
    return Pharmacy(
      count: json['count'],
      stores: List<Store>.from(json['stores'].map((x) => Store.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'stores': stores.map((store) => store.toJson()).toList(),
    };
  }
}

class Store {
  String addr;
  String code;
  String? createdAt;
  double lat;
  double lng;
  String name;
  String? remainStat;
  String? stockAt;
  String type;

  Store({
    required this.addr,
    required this.code,
    required this.createdAt,
    required this.lat,
    required this.lng,
    required this.name,
    required this.remainStat,
    required this.stockAt,
    required this.type,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      addr: json['addr'],
      code: json['code'],
      createdAt: json['created_at'],
      lat: json['lat'],
      lng: json['lng'],
      name: json['name'],
      remainStat: json['remain_stat'],
      stockAt: json['stock_at'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addr': addr,
      'code': code,
      'created_at': createdAt,
      'lat': lat,
      'lng': lng,
      'name': name,
      'remain_stat': remainStat,
      'stock_at': stockAt,
      'type': type,
    };
  }

  @override
  String toString() {
    return 'Store{addr: $addr, code: $code, createdAt: $createdAt, lat: $lat, lng: $lng, name: $name, remainStat: $remainStat, stockAt: $stockAt, type: $type}';
  }
}
