import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<Placemark> getUserLocation(LatLng currentPostion) async {
  List<Placemark> placemarks = await placemarkFromCoordinates(
    currentPostion.latitude,
    currentPostion.longitude,
    localeIdentifier: 'ru',
  );
  Placemark place = placemarks[0];
  print(place);
  return place;
}
