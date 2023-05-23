part of 'add_to_cart_cubit.dart';

@freezed
class AddToCartState with _$AddToCartState {
  const factory AddToCartState.loading() = _Loading;
  const factory AddToCartState.error(String error) = _Error;
  const factory AddToCartState.success(CartModel model) = _Success;
}
