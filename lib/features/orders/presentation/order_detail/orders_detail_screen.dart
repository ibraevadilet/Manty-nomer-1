import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:manty_nomer_1/core/functions/get_bytes_from_asset.dart';
import 'package:manty_nomer_1/core/functions/get_diraction_info.dart';
import 'package:manty_nomer_1/core/functions/get_local_positin.dart';
import 'package:manty_nomer_1/features/history/presentation/widgets/product_types_widget.dart';
import 'package:manty_nomer_1/features/orders/presentation/orders/cubits/get_order_detail_cubit/get_order_detail_cubit.dart';
import 'package:manty_nomer_1/theme/app_colors.dart';
import 'package:manty_nomer_1/theme/app_text_styles.dart';
import 'package:manty_nomer_1/widgets/app_error_text.dart';
import 'package:manty_nomer_1/widgets/app_indicator.dart';

@RoutePage()
class OrdersDetailScreen extends StatefulWidget {
  const OrdersDetailScreen({super.key, required this.orderId});
  final String orderId;

  @override
  State<OrdersDetailScreen> createState() => _OrdersDetailScreenState();
}

class _OrdersDetailScreenState extends State<OrdersDetailScreen> {
  late GoogleMapController googleMapController;
  BitmapDescriptor courierCurrantLocationIcon = BitmapDescriptor.defaultMarker;

  List<LatLng> polyloneCoordinates = [];

  void getPolyPoints(PointLatLng my, PointLatLng courier) async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyDM6dc3OFsjgutg13c5KqZ4HQANetppf2o',
      my,
      courier,
    );

    if (result.points.isNotEmpty) {
      for (var e in result.points) {
        polyloneCoordinates.add(
          LatLng(e.latitude, e.longitude),
        );
      }
    }

    setState(() {});
  }

  iconFunc() async {
    final Uint8List customMarker = await getBytesFromAsset(
      path: 'assets/images/courier.png',
      width: 100,
    );
    courierCurrantLocationIcon = BitmapDescriptor.fromBytes(customMarker);

    setState(() {});
  }

  @override
  void initState() {
    iconFunc();
    context.read<GetOrderDetailCubit>().getOrderInfo(widget.orderId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: BlocBuilder<GetOrderDetailCubit, GetOrderDetailState>(
          builder: (context, state) {
            return state.when(
              loading: () => const AppIndicator(),
              error: (error) => AppErrorText(error: error),
              success: (model) => Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        FutureBuilder(
                          future: getLocalPositin(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(
                                    snapshot.data!.latitude,
                                    snapshot.data!.longitude,
                                  ),
                                  zoom: 15,
                                ),
                                zoomControlsEnabled: true,
                                mapType: MapType.normal,
                                myLocationEnabled: true,
                                onMapCreated: (GoogleMapController controller) {
                                  googleMapController = controller;

                                  getPolyPoints(
                                    PointLatLng(
                                      snapshot.data!.latitude,
                                      snapshot.data!.longitude,
                                    ),
                                    PointLatLng(
                                      model.courierBeginlat!,
                                      model.courierBeginlon!,
                                    ),
                                  );
                                },
                                polylines: {
                                  Polyline(
                                    polylineId: const PolylineId('route'),
                                    points: polyloneCoordinates,
                                    color: AppColors.color8D02A5Violet,
                                    width: 3,
                                  )
                                },
                                markers: {
                                  Marker(
                                    markerId: const MarkerId('courierCurrant'),
                                    position: LatLng(
                                      model.courierCurrentlat!,
                                      model.courierCurrantlon!,
                                    ),
                                    icon: courierCurrantLocationIcon,
                                  ),
                                  Marker(
                                    markerId: const MarkerId('source'),
                                    position: LatLng(
                                      model.userLat,
                                      model.userLon,
                                    ),
                                  ),
                                  Marker(
                                    markerId: const MarkerId('courierBegin'),
                                    position: LatLng(
                                      model.courierBeginlat!,
                                      model.courierBeginlon!,
                                    ),
                                  ),
                                },
                              );
                            }
                            return const Center(
                              child: AppIndicator(),
                            );
                          },
                        ),
                        const Positioned(
                          left: 20,
                          top: 60,
                          child: CircleAvatar(
                            backgroundColor: AppColors.colore20912Red,
                            child: BackButton(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 100,
                          child: FutureBuilder(
                            future: getDiarationInfo(
                              LatLng(
                                model.courierCurrentlat!,
                                model.courierCurrantlon!,
                              ),
                              LatLng(
                                model.userLat,
                                model.userLon,
                              ),
                            ),
                            builder: (context, snpashot) {
                              if (snpashot.hasData) {
                                final diractionModel = snpashot.data!;
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.yellow,
                                  ),
                                  child: Text(
                                    '${diractionModel.distance}, ${diractionModel.duration}',
                                  ),
                                );
                              }
                              return const SizedBox();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Заказ номер 11',
                                  style: AppTextStyles.s20W700(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Column(
                              children: model.products
                                  .map<Widget>((e) => ProductTypesWidget(
                                        model: e,
                                        textColor: Colors.black,
                                      ))
                                  .toList(),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              'Общая сумма: ${model.totalAmount} сом',
                              style: AppTextStyles.s15W600(),
                            ),
                            Text(
                              'Время заказа: ${model.time}',
                              style: AppTextStyles.s15W600(),
                            ),
                            Text(
                              'Курьер: ${model.courier}',
                              style: AppTextStyles.s15W600(),
                            ),
                            Text(
                              'Адрес доставки: ${model.adres}',
                              style: AppTextStyles.s15W600(),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Статус:',
                                    style: AppTextStyles.s15W600(),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xFF009C05),
                                    ),
                                    child: Text(
                                      model.status,
                                      style: AppTextStyles.s15W600(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
