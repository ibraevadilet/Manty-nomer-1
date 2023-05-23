import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manty_nomer_1/core/functions/total_summ_func.dart';
import 'package:manty_nomer_1/features/animated_scroll/playground/animated_scroll_view/animated_scroll_view_item.dart';
import 'package:manty_nomer_1/features/cart/presentation/cubits/create_order_cubit/create_order_cubit.dart';
import 'package:manty_nomer_1/features/cart/presentation/cubits/get_cart_cubit/get_cart_cubit.dart';
import 'package:manty_nomer_1/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:manty_nomer_1/features/cart/presentation/widgets/show_adres_dialog.dart';
import 'package:manty_nomer_1/routes/mobile_app_router.gr.dart';
import 'package:manty_nomer_1/server/service_locator.dart';
import 'package:manty_nomer_1/widgets/app_error_text.dart';
import 'package:manty_nomer_1/widgets/app_indicator.dart';
import 'package:manty_nomer_1/widgets/custom_app_bar.dart';
import 'package:manty_nomer_1/widgets/default_button.dart';
import 'package:manty_nomer_1/widgets/styled_toasts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CreateOrderCubit>(),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Корзина'),
        body: SafeArea(
          child: BlocConsumer<CreateOrderCubit, CreateOrderState>(
            listener: (context, createOrderState) {
              createOrderState.whenOrNull(
                error: (error) => showErrorSnackBar(error),
                success: () {
                  showSuccessSnackBar(
                    'Заказ успешно отправлен!',
                  );
                  context.router.pushAndPopUntil(
                    BottomNavigatorRoute(pageIndex: 2),
                    predicate: (route) => false,
                  );
                },
              );
            },
            builder: (context, createOrderState) {
              return BlocBuilder<GetCartCubit, GetCartState>(
                builder: (context, state) {
                  return state.when(
                    loading: () => const AppIndicator(),
                    error: (error) => AppErrorText(error: error),
                    success: (model) => model.isEmpty
                        ? const Center(
                            child: Text('Вы еще не добавили блюдо в корзину'),
                          )
                        : Column(
                            children: [
                              Expanded(
                                child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 16),
                                  cacheExtent: 0,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 17, vertical: 20),
                                  itemCount: model.length,
                                  itemBuilder: (context, index) =>
                                      AnimatedScrollViewItem(
                                    child: CartItemWidget(
                                      model: model[index],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: CustomButton(
                                  isLoading: createOrderState.isLoading,
                                  color: const Color(0xFF8D02A5),
                                  onPress: () async {
                                    final fromBottom =
                                        await showAdressDialog(context);
                                    if (fromBottom['isOrdered']) {
                                      context
                                          .read<CreateOrderCubit>()
                                          .createOrder(
                                            model,
                                            fromBottom['adress'],
                                          );
                                    }
                                  },
                                  text:
                                      '${totalSumm(model)} сом  -  Оформить заказ',
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
