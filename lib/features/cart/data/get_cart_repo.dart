import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manty_nomer_1/core/constants/app_text_constants.dart';
import 'package:manty_nomer_1/features/cart/data/cart_model.dart';
import 'package:manty_nomer_1/features/menu/data/models/manty_model.dart';
import 'package:manty_nomer_1/server/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetCartRepo {
  Stream<List<CartModel>> getCart();
}

class GetCartRepoImpl implements GetCartRepo {
  GetCartRepoImpl();
  @override
  Stream<List<CartModel>> getCart() async* {
    final controller = StreamController<List<CartModel>>();

    final uid = sl<SharedPreferences>().getString(SharedKeys.uid);
    CollectionReference firestore =
        FirebaseFirestore.instance.collection('carts');
    try {
      final cartList = firestore.doc(uid).collection('cart').snapshots();

      cartList.listen((e) async {
        List<CartModel> carts = [];
        final futurecarts = e.docs.map(
          (e) async {
            final refs = await (e.data()['product']
                    as DocumentReference<Map<String, dynamic>>)
                .get();

            return CartModel(
              product: MantyModel.fromDocumentSnapshot(refs),
              count: e.data()['count'],
              id: e.data()['id'],
            );
          },
        ).toList();

        await Future.wait(
          futurecarts.map((e) async => carts.add(await e)).toList(),
        );
        carts.sort((a, b) => a.id.compareTo(b.id));
        controller.add(carts);
      });

      yield* controller.stream;
    } catch (e) {
      throw e.toString();
    }
  }
}
