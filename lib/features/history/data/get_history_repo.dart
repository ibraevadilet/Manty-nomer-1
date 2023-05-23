import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manty_nomer_1/core/constants/app_text_constants.dart';
import 'package:manty_nomer_1/features/orders/data/models/orders_model.dart';
import 'package:manty_nomer_1/server/service_locator.dart';

import 'package:shared_preferences/shared_preferences.dart';

abstract class GetHistoryRepo {
  Future<List<OrdersModel>> getHistory();
}

class GetHistoryRepoImpl implements GetHistoryRepo {
  GetHistoryRepoImpl();
  @override
  Future<List<OrdersModel>> getHistory() async {
    final uid = sl<SharedPreferences>().getString(SharedKeys.uid);
    CollectionReference firestore = FirebaseFirestore.instance
        .collection('userHistory')
        .doc(uid)
        .collection('history');
    try {
      final historyList = await firestore.get();
      List<OrdersModel> history = [];

      for (var e in historyList.docs) {
        history.add(OrdersModel.fromQuerySnapshot(e));
      }

      return history;
    } catch (e) {
      throw e.toString();
    }
  }
}
