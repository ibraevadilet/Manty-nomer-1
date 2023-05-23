import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:manty_nomer_1/features/cart/data/cart_model.dart';
import 'package:manty_nomer_1/features/cart/data/create_order_repo.dart';
import 'package:manty_nomer_1/features/cart/presentation/cubits/get_cart_cubit/get_cart_cubit.dart';
import 'package:manty_nomer_1/server/service_locator.dart';

part 'create_order_state.dart';
part 'create_order_cubit.freezed.dart';

class CreateOrderCubit extends Cubit<CreateOrderState> {
  CreateOrderCubit(this.repo) : super(const CreateOrderState.initial());

  final CreateOrderRepo repo;

  Future<void> createOrder(List<CartModel> model, String adres) async {
    emit(const CreateOrderState.loading());
    try {
      await repo.createOrder(model, adres);
      sl<GetCartCubit>().getCart();
      emit(const CreateOrderState.success());
    } catch (e) {
      emit(CreateOrderState.error(e.toString()));
    }
  }
}
