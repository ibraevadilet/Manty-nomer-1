import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:manty_nomer_1/features/history/data/get_history_repo.dart';
import 'package:manty_nomer_1/features/orders/data/models/orders_model.dart';

part 'get_history_state.dart';
part 'get_history_cubit.freezed.dart';

class GetHistoryCubit extends Cubit<GetHistoryState> {
  GetHistoryCubit(this.repo) : super(const GetHistoryState.loading()) {
    getHistory();
  }

  final GetHistoryRepo repo;
  getHistory() async {
    try {
      final historyList = await repo.getHistory();
      emit(GetHistoryState.success(historyList));
    } catch (e) {
      emit(GetHistoryState.error(e.toString()));
    }
  }
}
