import 'dart:convert';

class DataList {
  List<CollectionChartData> collectionChartDataList;

  DataList({
    required this.collectionChartDataList,
  });

  Map<String, dynamic> toJson() {
    return {
      'collectionChartData': collectionChartDataList.map((e) => e.toJson()).toList(),
    };
  }

  factory DataList.fromJson(Map<String, dynamic> map) {
    List list = map['collectionChartDataList'];
    List<CollectionChartData> collectionChartList = list.map((e) => CollectionChartData.fromJson(e)).toList();

    return DataList(
      collectionChartDataList: collectionChartList,
    );
  }

  @override
  String toString() {
    return 'DataList{collectionChartDataList: $collectionChartDataList}';
  }
}

class CollectionChartData {
  String collectionName;
  List<CollectionSalePrice> collectionSalePrice;

  CollectionChartData({
    required this.collectionName,
    required this.collectionSalePrice,
  });

  Map<String, dynamic> toJson() {
    return {
      'collectionName': collectionName,
      'collectionSalePrice': collectionSalePrice.map((e) => e.toJson()).toList(),
    };
  }

  factory CollectionChartData.fromJson(Map<String, dynamic> map) {
    List list = map['collectionSalePrice'] ?? [];
    List<CollectionSalePrice> collectionSalePrice = list.map((e) => CollectionSalePrice.fromJson(e)).toList();

    return CollectionChartData(
      collectionName: map['collectionName'] as String,
      collectionSalePrice: collectionSalePrice,
    );
  }

  @override
  String toString() {
    return 'CollectionChartData{collectionName: $collectionName, collectionSalePrice: $collectionSalePrice}';
  }
}

class CollectionSalePrice {
  double price;
  DateTime? cvtDateTime;

  CollectionSalePrice({
    required this.price,
    required this.cvtDateTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'cvtDateTime': cvtDateTime,
    };
  }

  factory CollectionSalePrice.fromJson(Map<String, dynamic> map) {
    return CollectionSalePrice(
      price: map['price'] as double,
      cvtDateTime: map['cvtDateTime'] as DateTime?,
    );
  }

  @override
  String toString() {
    return 'CollectionSalePrice{price: $price, cvtDateTime: $cvtDateTime}';
  }
}

void debugSolution1() {
  final String json = '''{
 "collectionChartDataList": [
   {
     "collectionName": "collectionName",
     "collectionSalePrice": null
   },
   {
     "collectionName": "collectionName",
     "collectionSalePrice": [
       {
         "price": 59.75,
         "cvtDatetime": "2023-03-26T08:08:35"
       },
       {
         "price": 60.00,
         "cvtDatetime": "2023-03-26T08:08:45"
       }
     ]
   }
 ]
}''';

  Map<String, dynamic> map = jsonDecode(json);
  DataList dataList = DataList.fromJson(map);

  print(jsonEncode(dataList)); // good!

  print(dataList.collectionChartDataList[1].collectionSalePrice[0].price); // 59.75
}
