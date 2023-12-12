import 'dart:convert';

class DataList {
  List<CollectionChartData> collectionChartDataList;

  DataList({
    required this.collectionChartDataList,
  });

  Map<String, dynamic> toMap() {
    return {
      'collectionChartData': collectionChartDataList,
    };
  }

  factory DataList.fromMap(Map<String, dynamic> map) {
    List list = map['collectionChartDataList'];
    List<CollectionChartData> collectionChartList = list.map((e) => CollectionChartData.fromMap(e)).toList();

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

  Map<String, dynamic> toMap() {
    return {
      'collectionName': collectionName,
      'collectionSalePrice': collectionSalePrice,
    };
  }

  factory CollectionChartData.fromMap(Map<String, dynamic> map) {
    List list = map['collectionSalePrice'] ?? [];
    List<CollectionSalePrice> collectionSalePrice = list.map((e) => CollectionSalePrice.fromMap(e)).toList();

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

  Map<String, dynamic> toMap() {
    return {
      'price': price,
      'cvtDateTime': cvtDateTime,
    };
  }

  factory CollectionSalePrice.fromMap(Map<String, dynamic> map) {
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
  DataList dataList = DataList.fromMap(map);

  print(dataList.collectionChartDataList[1].collectionSalePrice[0].price); // 59.75
}
