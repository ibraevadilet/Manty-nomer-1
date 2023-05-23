import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manty_nomer_1/core/constants/app_text_constants.dart';
import 'package:manty_nomer_1/core/formatters/date_formates.dart';
import 'package:manty_nomer_1/core/functions/get_local_positin.dart';
import 'package:manty_nomer_1/core/functions/total_summ_func.dart';
import 'package:manty_nomer_1/features/cart/data/cart_model.dart';
import 'package:manty_nomer_1/features/orders/data/models/orders_model.dart';
import 'package:manty_nomer_1/server/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CreateOrderRepo {
  Future<void> createOrder(List<CartModel> model, String adres);
}

class CreateOrderRepoImpl implements CreateOrderRepo {
  CreateOrderRepoImpl();
  @override
  Future<void> createOrder(List<CartModel> model, String adres) async {
    final uid = sl<SharedPreferences>().getString(SharedKeys.uid) ?? '';
    final id = DateTime.now().microsecondsSinceEpoch;

    final location = await getLocalPositin();

    final orderModel = OrdersModel(
      id: '$id$uid',
      uId: uid,
      adres: adres,
      userLat: location.latitude,
      userLon: location.longitude,
      courier: '',
      status: 'В обработке',
      time: orderTimeFormat.format(DateTime.now()),
      totalAmount: totalSumm(model),
      isMap: false,
      products: model
          .map<Product>(
            (e) => Product(
              count: e.count,
              name: e.product.title,
              summa: e.count * e.product.price,
            ),
          )
          .toList(),
    );

    DocumentReference orderFirestore = FirebaseFirestore.instance
        .collection('orders')
        .doc(uid)
        .collection('order')
        .doc('$id$uid');

    DocumentReference courierOrdersFirestore =
        FirebaseFirestore.instance.collection('courierOrders').doc('$id$uid');

    CollectionReference cartFirestore = FirebaseFirestore.instance
        .collection('carts')
        .doc(uid)
        .collection('cart');

    try {
      await orderFirestore.set(orderModel.toJson());
      await courierOrdersFirestore.set(orderModel.toJson());

      await Future.wait(
        model
            .map((e) async => await cartFirestore.doc(e.id.toString()).delete())
            .toList(),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
