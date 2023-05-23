import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:manty_nomer_1/features/orders/data/models/orders_model.dart';
import 'package:manty_nomer_1/features/orders/data/repositories/get_orders_repo.dart';

part 'get_orders_state.dart';
part 'get_orders_cubit.freezed.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit(this.repo) : super(const GetOrdersState.loading()) {
    getOrders();
  }

  final GetOrdersRepo repo;

  getOrders() {
    try {
      repo.getOrders().listen((data) {
        emit(GetOrdersState.success(List.from(data)));
      });
    } catch (e) {
      emit(GetOrdersState.error(e.toString()));
    }
  }
}
