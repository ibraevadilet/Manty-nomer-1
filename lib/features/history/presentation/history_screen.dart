import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manty_nomer_1/features/animated_scroll/playground/animated_scroll_view/animated_scroll_view_item.dart';
import 'package:manty_nomer_1/features/history/presentation/cubits/cubit/get_history_cubit.dart';
import 'package:manty_nomer_1/features/history/presentation/widgets/history_container_widget.dart';
import 'package:manty_nomer_1/server/service_locator.dart';
import 'package:manty_nomer_1/widgets/app_error_text.dart';
import 'package:manty_nomer_1/widgets/app_indicator.dart';
import 'package:manty_nomer_1/widgets/custom_app_bar.dart';

@RoutePage()
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetHistoryCubit>(),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'История заказов'),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 12),
                Expanded(
                  child: BlocBuilder<GetHistoryCubit, GetHistoryState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () => const AppIndicator(),
                        error: (error) => AppErrorText(error: error),
                        success: (model) => ListView.separated(
                          itemCount: model.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) =>
                              AnimatedScrollViewItem(
                            child: HistoryContainerWidget(
                              model: model[index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
