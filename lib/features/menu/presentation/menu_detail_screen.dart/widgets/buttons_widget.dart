import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manty_nomer_1/features/menu/presentation/menu_detail_screen.dart/blocs/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:manty_nomer_1/routes/mobile_app_router.gr.dart';
import 'package:manty_nomer_1/theme/app_colors.dart';
import 'package:manty_nomer_1/theme/app_text_styles.dart';
import 'package:manty_nomer_1/widgets/app_error_text.dart';
import 'package:manty_nomer_1/widgets/app_indicator.dart';
import 'package:manty_nomer_1/widgets/default_button.dart';

class ButtonsWidget extends StatefulWidget {
  const ButtonsWidget({
    super.key,
    required this.addAnimation,
    required this.removeAnimation,
    required this.containerKey,
    required this.id,
  });
  final void Function(GlobalKey) addAnimation;
  final void Function() removeAnimation;
  final GlobalKey<CartIconKey> containerKey;
  final int id;

  @override
  State<ButtonsWidget> createState() => _ButtonsWidgetState();
}

class _ButtonsWidgetState extends State<ButtonsWidget> {
  final GlobalKey addWidgetKey = GlobalKey();
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddToCartCubit, AddToCartState>(
      builder: (context, state) {
        return state.when(
          loading: () => const AppIndicator(),
          error: (error) => AppErrorText(error: error),
          success: (model) {
            count = model.count;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            count--;
                            widget.removeAnimation();
                            context
                                .read<AddToCartCubit>()
                                .addToCart(widget.id, count);
                          },
                          child: const CircleAvatar(
                            backgroundColor: AppColors.colore20912Red,
                            radius: 15,
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        AddToCartIcon(
                          key: widget.containerKey,
                          icon: Stack(
                            alignment: Alignment.center,
                            children: [
                              Opacity(
                                opacity: 0,
                                child: Container(
                                  key: addWidgetKey,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Text(
                                      '+ 1',
                                      style: AppTextStyles.s20W700(
                                        color: Colors.purple,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                count.toString(),
                                style: AppTextStyles.s20W700(
                                  color: AppColors.colore20912Red,
                                ),
                              ),
                            ],
                          ),
                          badgeOptions: const BadgeOptions(active: false),
                        ),
                        InkWell(
                          onTap: () {
                            count++;
                            widget.addAnimation(addWidgetKey);

                            context
                                .read<AddToCartCubit>()
                                .addToCart(widget.id, count);
                          },
                          child: const CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.colore20912Red,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomButton(
                      onPress: () {
                        context.router.pushAndPopUntil(
                          BottomNavigatorRoute(pageIndex: 1),
                          predicate: (route) => false,
                        );
                      },
                      text: 'Заказать',
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
