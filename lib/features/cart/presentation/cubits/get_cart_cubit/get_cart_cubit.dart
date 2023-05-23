import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:manty_nomer_1/features/cart/data/cart_model.dart';
import 'package:manty_nomer_1/features/cart/data/get_cart_repo.dart';

part 'get_cart_state.dart';
part 'get_cart_cubit.freezed.dart';

class GetCartCubit extends Cubit<GetCartState> {
  GetCartCubit(this.repo) : super(const GetCartState.loading()) {
    getCart();
  }

  final GetCartRepo repo;

  getCart() {
    try {
      repo.getCart().listen((data) {
        emit(GetCartState.success(data));
      });
    } catch (e) {
      emit(GetCartState.error(e.toString()));
    }
  }
}
