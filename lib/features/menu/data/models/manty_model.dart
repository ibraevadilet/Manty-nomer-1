import 'package:cloud_firestore/cloud_firestore.dart';

class MantyModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final int price;
  MantyModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'price': price,
    };
  }

  factory MantyModel.fromJson(Map<dynamic, dynamic> json) {
    return MantyModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
    );
  }
  factory MantyModel.fromDocumentSnapshot(DocumentSnapshot json) {
    return MantyModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
    );
  }

  @override
  bool operator ==(covariant MantyModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.image == image &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        image.hashCode ^
        price.hashCode;
  }
}
