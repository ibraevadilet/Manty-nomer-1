import 'package:manty_nomer_1/features/menu/data/models/manty_model.dart';

class CartModel {
  final MantyModel product;
  final int count;
  final int id;
  CartModel({
    required this.product,
    required this.count,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'product': product.toJson(),
      'count': count,
    };
  }

  factory CartModel.fromJson(Map<String, dynamic> map) {
    return CartModel(
      product: MantyModel.fromJson(map['product'] as Map),
      count: map['count'],
      id: map['id'],
    );
  }

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;

    return other.product == product && other.count == count;
  }

  @override
  int get hashCode => product.hashCode ^ count.hashCode;
}
