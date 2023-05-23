part of 'get_history_cubit.dart';

@freezed
class GetHistoryState with _$GetHistoryState {
  const factory GetHistoryState.loading() = _Loading;
  const factory GetHistoryState.error(String error) = _Error;
  const factory GetHistoryState.success(List<OrdersModel> model) = _Success;
}
