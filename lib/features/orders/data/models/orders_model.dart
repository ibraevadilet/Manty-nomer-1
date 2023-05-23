// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersModel {
  final String id;
  final String uId;
  final String adres;
  final String courier;
  final String status;
  final String time;
  final int totalAmount;
  final bool isMap;
  final List<Product> products;
  final String? deliverytime;
  final double? courierBeginlat;
  final double? courierBeginlon;
  final double? courierCurrentlat;
  final double? courierCurrantlon;
  final double userLat;
  final double userLon;

  OrdersModel({
    required this.id,
    required this.uId,
    required this.adres,
    required this.courier,
    required this.status,
    required this.time,
    required this.totalAmount,
    required this.isMap,
    required this.products,
    required this.userLat,
    required this.userLon,
    this.courierBeginlat,
    this.courierBeginlon,
    this.courierCurrentlat,
    this.courierCurrantlon,
    this.deliverytime,
  });

  factory OrdersModel.fromJson(Map<dynamic, dynamic> json) => OrdersModel(
        id: json["id"],
        uId: json["uId"],
        adres: json["adres"],
        courier: json["courier"],
        status: json["status"],
        time: json["time"],
        totalAmount: json["totalAmount"],
        isMap: json["isMap"],
        userLat: json["userLat"],
        userLon: json["userLon"],
        deliverytime: json['deliverytime'],
        courierBeginlat: json['courierBeginlat'],
        courierBeginlon: json['courierBeginlon'],
        courierCurrentlat: json['courierCurrentlat'],
        courierCurrantlon: json['courierCurrantlon'],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  factory OrdersModel.fromQuerySnapshot(QueryDocumentSnapshot json) =>
      OrdersModel(
        id: json["id"],
        uId: json["uId"],
        adres: json["adres"],
        courier: json["courier"],
        status: json["status"],
        time: json["time"],
        totalAmount: json["totalAmount"],
        isMap: json["isMap"],
        userLat: json["userLat"],
        userLon: json["userLon"],
        courierBeginlat: json.data().toString().contains('courierBeginlat')
            ? json['courierBeginlat']
            : null,
        courierBeginlon: json.data().toString().contains('courierBeginlon')
            ? json['courierBeginlon']
            : null,
        courierCurrentlat: json.data().toString().contains('courierCurrentlat')
            ? json['courierCurrentlat']
            : null,
        courierCurrantlon: json.data().toString().contains('courierCurrantlon')
            ? json['courierCurrantlon']
            : null,
        deliverytime: json.data().toString().contains('deliverytime')
            ? json['deliverytime']
            : null,
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uId": uId,
        "adres": adres,
        "courier": courier,
        "status": status,
        "time": time,
        "totalAmount": totalAmount,
        "isMap": isMap,
        "userLat": userLat,
        "userLon": userLon,
        "deliverytime": deliverytime,
        "courierBeginlat": courierBeginlat,
        "courierBeginlon": courierBeginlon,
        "courierCurrentlat": courierCurrentlat,
        "courierCurrantlon": courierCurrantlon,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };

  OrdersModel copyWith({
    String? id,
    String? uId,
    String? adres,
    String? courier,
    String? status,
    String? time,
    int? totalAmount,
    bool? isMap,
    String? deliverytime,
    double? courierBeginlat,
    double? courierBeginlon,
    double? courierCurrentlat,
    double? courierCurrantlon,
    double? userLat,
    double? userLon,
    List<Product>? products,
  }) {
    return OrdersModel(
      id: id ?? this.id,
      uId: uId ?? this.uId,
      adres: adres ?? this.adres,
      courier: courier ?? this.courier,
      status: status ?? this.status,
      time: time ?? this.time,
      totalAmount: totalAmount ?? this.totalAmount,
      isMap: isMap ?? this.isMap,
      deliverytime: deliverytime ?? this.deliverytime,
      products: products ?? this.products,
      courierBeginlat: courierBeginlat ?? this.courierBeginlat,
      courierBeginlon: courierBeginlon ?? this.courierBeginlon,
      courierCurrentlat: courierCurrentlat ?? this.courierCurrentlat,
      courierCurrantlon: courierCurrantlon ?? this.courierCurrantlon,
      userLat: userLat ?? this.userLat,
      userLon: userLon ?? this.userLon,
    );
  }
}

class Product {
  final int count;
  final String name;
  final int summa;

  Product({
    required this.count,
    required this.name,
    required this.summa,
  });

  factory Product.fromJson(Map<dynamic, dynamic> json) => Product(
        count: json["count"],
        name: json["name"],
        summa: json["summa"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "name": name,
        "summa": summa,
      };
}
