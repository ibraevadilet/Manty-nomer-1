import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manty_nomer_1/features/animated_scroll/playground/animated_scroll_view/animated_scroll_view_item.dart';
import 'package:manty_nomer_1/features/orders/presentation/orders/cubits/get_orders_cubit/get_orders_cubit.dart';
import 'package:manty_nomer_1/features/orders/presentation/orders/widgets/order_container_widget.dart';
import 'package:manty_nomer_1/widgets/app_error_text.dart';
import 'package:manty_nomer_1/widgets/app_indicator.dart';
import 'package:manty_nomer_1/widgets/custom_app_bar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Текущие заказы'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Expanded(
                child: BlocBuilder<GetOrdersCubit, GetOrdersState>(
                  builder: (context, state) {
                    return state.when(
                      loading: () => const AppIndicator(),
                      error: (error) => AppErrorText(error: error),
                      success: (model) => model.isEmpty
                          ? const Center(
                              child: Text('У вас нет активных заказов'),
                            )
                          : ListView.separated(
                              itemCount: model.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 12),
                              itemBuilder: (context, index) =>
                                  AnimatedScrollViewItem(
                                child: OrderContainerWidget(
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
    );
  }
}
