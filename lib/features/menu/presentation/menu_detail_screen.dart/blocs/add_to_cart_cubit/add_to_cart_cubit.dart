import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:manty_nomer_1/features/cart/data/cart_model.dart';
import 'package:manty_nomer_1/features/menu/data/repository/add_product_to_cart_repo.dart';

part 'add_to_cart_state.dart';
part 'add_to_cart_cubit.freezed.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this.repo) : super(const AddToCartState.loading());
  final AddToCartRepo repo;

  getProductCount(int id) {
    try {
      repo.getProductFromCart(id).listen((data) {
        emit(AddToCartState.success(data));
      });
    } catch (e) {
      emit(AddToCartState.error(e.toString()));
    }
  }

  addToCart(int id, int count) async {
    try {
      await repo.addToCart(id, count);
    } catch (e) {
      emit(AddToCartState.error(e.toString()));
    }
  }
}
