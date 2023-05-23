part of 'get_order_detail_cubit.dart';

@freezed
class GetOrderDetailState with _$GetOrderDetailState {
  const factory GetOrderDetailState.loading() = _Loading;
  const factory GetOrderDetailState.error(String error) = _Error;
  const factory GetOrderDetailState.success(OrdersModel model) = _Initial;
}
