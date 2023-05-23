import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manty_nomer_1/core/constants/app_text_constants.dart';
import 'package:manty_nomer_1/features/cart/data/cart_model.dart';
import 'package:manty_nomer_1/features/menu/data/models/manty_model.dart';
import 'package:manty_nomer_1/server/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AddToCartRepo {
  Future<void> addToCart(int id, int count);
  Stream<CartModel> getProductFromCart(int id);
}

class AddToCartRepoImpl implements AddToCartRepo {
  AddToCartRepoImpl();

  @override
  Stream<CartModel> getProductFromCart(int id) async* {
    final controller = StreamController<CartModel>();
    final uid = sl<SharedPreferences>().getString(SharedKeys.uid);
    DocumentReference firestore = FirebaseFirestore.instance
        .collection('carts')
        .doc(uid)
        .collection('cart')
        .doc(id.toString());
    try {
      final cartList = firestore.snapshots();

      cartList.listen((e) async {
        if (e.data() != null) {
          final refs = await ((e.data() as Map)['product']
                  as DocumentReference<Map<String, dynamic>>)
              .get();
          final product = CartModel(
            product: MantyModel.fromDocumentSnapshot(refs),
            count: (e.data() as Map)['count'],
            id: id,
          );

          controller.add(product);
        } else {
          controller.add(
            CartModel(
              product: MantyModel(
                id: id,
                title: 'title',
                description: 'description',
                image: 'image',
                price: 120,
              ),
              count: 0,
              id: id,
            ),
          );
        }
      });

      yield* controller.stream;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> addToCart(int id, int count) async {
    final uid = sl<SharedPreferences>().getString(SharedKeys.uid);

    final data = {
      'count': count,
      'id': id,
      'product': FirebaseFirestore.instance.doc('products/$id')
    };

    DocumentReference firestore = FirebaseFirestore.instance
        .collection('carts')
        .doc(uid)
        .collection('cart')
        .doc(id.toString());

    if (count == 1) {
      firestore.set(data);
    } else if (count == 0) {
      firestore.delete();
    } else {
      firestore.update({'count': count});
    }
  }
}
