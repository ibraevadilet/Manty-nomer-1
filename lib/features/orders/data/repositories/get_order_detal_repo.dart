import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manty_nomer_1/core/constants/app_text_constants.dart';
import 'package:manty_nomer_1/features/orders/data/models/orders_model.dart';

import 'package:manty_nomer_1/server/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetOrderDetailRepo {
  Stream<OrdersModel> getOrderDetail(String orderId);
}

class GetOrderDetailRepoImpl implements GetOrderDetailRepo {
  GetOrderDetailRepoImpl();
  @override
  Stream<OrdersModel> getOrderDetail(String orderId) async* {
    final controller = StreamController<OrdersModel>();

    final uid = sl<SharedPreferences>().getString(SharedKeys.uid);
    CollectionReference firestore =
        FirebaseFirestore.instance.collection('orders');
    try {
      final ordersList =
          firestore.doc(uid).collection('order').doc(orderId).snapshots();

      ordersList.listen((e) async {
        if (e.data() != null) {
          controller.add(OrdersModel.fromJson(e.data() as Map));
        }
      });

      yield* controller.stream;
    } catch (e) {
      throw e.toString();
    }
  }
}
