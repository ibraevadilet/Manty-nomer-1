part of 'get_products_cubit.dart';

@freezed
class GetProductsState with _$GetProductsState {
  const factory GetProductsState.loading() = _Loading;
  const factory GetProductsState.error(String error) = _Error;
  const factory GetProductsState.success(List<MantyModel> model) = _Success;
}
