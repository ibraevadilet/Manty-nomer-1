part of 'get_orders_cubit.dart';

@freezed
class GetOrdersState with _$GetOrdersState {
  const factory GetOrdersState.loading() = _Loading;
  const factory GetOrdersState.error(String error) = _Error;
  const factory GetOrdersState.success(List<OrdersModel> model) = _Success;
}
