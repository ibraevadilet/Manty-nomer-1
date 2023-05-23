import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:manty_nomer_1/features/orders/data/models/orders_model.dart';
import 'package:manty_nomer_1/features/orders/data/repositories/get_order_detal_repo.dart';

part 'get_order_detail_state.dart';
part 'get_order_detail_cubit.freezed.dart';

class GetOrderDetailCubit extends Cubit<GetOrderDetailState> {
  GetOrderDetailCubit(this.repo) : super(const GetOrderDetailState.loading());

  final GetOrderDetailRepo repo;

  getOrderInfo(String orderId) async {
    try {
      repo.getOrderDetail(orderId).listen((info) {
        emit(GetOrderDetailState.success(info));
      });
    } catch (e) {
      emit(GetOrderDetailState.error(e.toString()));
    }
  }
}
