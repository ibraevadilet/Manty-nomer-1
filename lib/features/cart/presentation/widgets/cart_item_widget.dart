import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manty_nomer_1/features/cart/data/cart_model.dart';
import 'package:manty_nomer_1/features/menu/presentation/menu_detail_screen.dart/blocs/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:manty_nomer_1/routes/mobile_app_router.gr.dart';
import 'package:manty_nomer_1/theme/app_colors.dart';
import 'package:manty_nomer_1/theme/app_text_styles.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({
    super.key,
    required this.model,
  });
  final CartModel model;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(
          MenuDetailRoute(manty: widget.model.product),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.colore20912Red,
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: widget.model.product.image,
              height: 35,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model.product.title,
                    style: AppTextStyles.s16W500(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'Сумма: ',
                              style: AppTextStyles.s15W400(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              (widget.model.count * widget.model.product.price)
                                  .toString(),
                              style: AppTextStyles.s15W400(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                context.read<AddToCartCubit>().addToCart(
                                    widget.model.id, widget.model.count - 1);
                              },
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              widget.model.count.toString(),
                              style: AppTextStyles.s20W700(
                                color: Colors.white,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                context.read<AddToCartCubit>().addToCart(
                                    widget.model.id, widget.model.count + 1);
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
