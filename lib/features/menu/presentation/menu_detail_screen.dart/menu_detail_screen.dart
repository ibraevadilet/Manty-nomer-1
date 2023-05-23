import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manty_nomer_1/core/constants/app_text_constants.dart';
import 'package:manty_nomer_1/features/menu/data/models/manty_model.dart';
import 'package:manty_nomer_1/features/menu/presentation/menu_detail_screen.dart/blocs/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:manty_nomer_1/features/menu/presentation/menu_detail_screen.dart/widgets/buttons_widget.dart';
import 'package:manty_nomer_1/features/menu/presentation/menu_detail_screen.dart/widgets/image_container_widget.dart';
import 'package:manty_nomer_1/features/menu/presentation/menu_detail_screen.dart/widgets/manty_info_widget.dart';
import 'package:manty_nomer_1/routes/mobile_app_router.gr.dart';
import 'package:manty_nomer_1/server/service_locator.dart';
import 'package:manty_nomer_1/widgets/default_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class MenuDetailScreen extends StatefulWidget {
  const MenuDetailScreen({
    required this.manty,
    Key? key,
  }) : super(key: key);

  final MantyModel manty;

  @override
  State<MenuDetailScreen> createState() => _MenuDetailScreenState();
}

class _MenuDetailScreenState extends State<MenuDetailScreen> {
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  GlobalKey<CartIconKey> containerKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  late Function(GlobalKey) runRemoveCartAnimation;

  final GlobalKey removeWidgetKey = GlobalKey();

  Future<int> getProductCount() async {
    final uid = sl<SharedPreferences>().getString(SharedKeys.uid);
    final firestore = await FirebaseFirestore.instance
        .collection('carts')
        .doc(uid)
        .collection('cart')
        .doc(widget.manty.id.toString())
        .get();

    final result = firestore.data();
    if (result != null) {
      return firestore['count'];
    }

    return 0;
  }

  void addAnimation(GlobalKey widgetKey) async {
    int cartQuantityItems = await getProductCount();
    await runAddToCartAnimation(widgetKey);
    await cartKey.currentState!
        .runCartAnimation((++cartQuantityItems).toString());
  }

  void removeAnimation(GlobalKey widgetKey) async {
    int cartQuantityItems = await getProductCount();
    await cartKey.currentState!
        .runCartAnimation((--cartQuantityItems).toString());
    await runRemoveCartAnimation(widgetKey);
  }

  @override
  void initState() {
    context.read<AddToCartCubit>().getProductCount(widget.manty.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
      cartKey: containerKey,
      height: 30,
      width: 30,
      opacity: 0.85,
      createAddToCartAnimation: (runRemoveToCartAnimation) {
        runRemoveCartAnimation = runRemoveToCartAnimation;
      },
      child: AddToCartAnimation(
        cartKey: cartKey,
        height: 30,
        width: 30,
        opacity: 0.85,
        createAddToCartAnimation: (runAddToCartAnimation) {
          this.runAddToCartAnimation = runAddToCartAnimation;
        },
        child: Scaffold(
          body: Column(
            children: [
              ImageContainerWidget(
                cartKey: cartKey,
                manty: widget.manty,
                removeWidgetKey: removeWidgetKey,
              ),
              const SizedBox(height: 20),
              MantyInfoWidget(manty: widget.manty),
              const Spacer(),
              sl<SharedPreferences>().getString(SharedKeys.authEmail) == null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomButton(
                        onPress: () {
                          context.router.push(const AuthRoute());
                        },
                        text: 'Заказать',
                      ),
                    )
                  : ButtonsWidget(
                      id: widget.manty.id,
                      addAnimation: addAnimation,
                      removeAnimation: () => removeAnimation(removeWidgetKey),
                      containerKey: containerKey,
                    ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
