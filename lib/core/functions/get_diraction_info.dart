import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:manty_nomer_1/features/orders/data/models/diration_model.dart';

Future<DiractionModel> getDiarationInfo(LatLng courier, LatLng my) async {
  const String baseUrl = 'https://maps.googleapis.com/maps/api/directions/json';

  final Dio dio = Dio();

  final response = await dio.get(baseUrl, queryParameters: {
    'origin': '${courier.latitude},${courier.longitude}',
    'destination': '${my.latitude},${my.longitude}',
    'key': 'AIzaSyDM6dc3OFsjgutg13c5KqZ4HQANetppf2o',
  });

  return DiractionModel.fromMap(response.data);
}
