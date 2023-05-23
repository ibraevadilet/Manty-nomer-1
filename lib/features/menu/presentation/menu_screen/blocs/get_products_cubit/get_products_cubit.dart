import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:manty_nomer_1/features/menu/data/models/manty_model.dart';
import 'package:manty_nomer_1/features/menu/data/repository/get_products_repo.dart';

part 'get_products_state.dart';
part 'get_products_cubit.freezed.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit(this.repo) : super(const GetProductsState.loading()) {
    getProducts();
  }
  final GetProductsRepo repo;

  Future<void> getProducts() async {
    emit(const GetProductsState.loading());
    try {
      final products = await repo.getProducts();
      emit(GetProductsState.success(products));
    } catch (e) {
      emit(GetProductsState.error(e.toString()));
    }
  }
}
