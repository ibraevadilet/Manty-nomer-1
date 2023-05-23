part of 'get_cart_cubit.dart';

@freezed
class GetCartState with _$GetCartState {
  const factory GetCartState.loading() = _Loading;
  const factory GetCartState.error(String error) = _Error;
  const factory GetCartState.success(List<CartModel> model) = _Success;
}
