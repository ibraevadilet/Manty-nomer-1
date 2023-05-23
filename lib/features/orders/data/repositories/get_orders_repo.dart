import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manty_nomer_1/core/constants/app_text_constants.dart';
import 'package:manty_nomer_1/features/orders/data/models/orders_model.dart';

import 'package:manty_nomer_1/server/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetOrdersRepo {
  Stream<List<OrdersModel>> getOrders();
}

class GetOrdersRepoImpl implements GetOrdersRepo {
  GetOrdersRepoImpl();
  @override
  Stream<List<OrdersModel>> getOrders() async* {
    final controller = StreamController<List<OrdersModel>>();

    final uid = sl<SharedPreferences>().getString(SharedKeys.uid);
    CollectionReference firestore =
        FirebaseFirestore.instance.collection('orders');
    try {
      final ordersList = firestore.doc(uid).collection('order').snapshots();

      ordersList.listen((e) async {
        List<OrdersModel> orders = [];

        for (var e in e.docs) {
          orders.add(OrdersModel.fromJson(e.data()));
        }
        controller.add(orders);
      });

      yield* controller.stream;
    } catch (e) {
      throw e.toString();
    }
  }
}
