import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manty_nomer_1/core/constants/app_text_constants.dart';
import 'package:manty_nomer_1/features/menu/data/models/manty_model.dart';
import 'package:manty_nomer_1/routes/mobile_app_router.gr.dart';
import 'package:manty_nomer_1/server/service_locator.dart';
import 'package:manty_nomer_1/theme/app_colors.dart';
import 'package:manty_nomer_1/theme/app_text_styles.dart';
import 'package:manty_nomer_1/widgets/app_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageContainerWidget extends StatefulWidget {
  const ImageContainerWidget({
    super.key,
    required this.cartKey,
    required this.manty,
    required this.removeWidgetKey,
  });

  final GlobalKey<CartIconKey> cartKey;
  final MantyModel manty;
  final GlobalKey removeWidgetKey;

  @override
  State<ImageContainerWidget> createState() => _ImageContainerWidgetState();
}

class _ImageContainerWidgetState extends State<ImageContainerWidget> {
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

  Future<int> initCount() async {
    int cartQuantityItems = await getProductCount();
    await widget.cartKey.currentState!
        .runCartAnimation((cartQuantityItems).toString());
    return cartQuantityItems;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 40),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColors.colore20912Red,
          ),
          child: Hero(
            tag: '__recipe_${widget.manty.id}_image__',
            child: CachedNetworkImage(
              imageUrl: widget.manty.image,
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: 60,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        sl<SharedPreferences>().getString(SharedKeys.authEmail) == null
            ? const SizedBox()
            : Positioned(
                right: 20,
                top: 60,
                child: InkWell(
                  onTap: () => context.router.pushAndPopUntil(
                    BottomNavigatorRoute(pageIndex: 1),
                    predicate: (route) => false,
                  ),
                  child: AddToCartIcon(
                    key: widget.cartKey,
                    icon: FutureBuilder(
                      future: initCount(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Opacity(
                                opacity: 0,
                                child: Container(
                                  key: widget.removeWidgetKey,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Text(
                                      '- 1',
                                      style: AppTextStyles.s20W700(
                                        color: Colors.purple,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                            ],
                          );
                        }
                        return const AppIndicator();
                      },
                    ),
                    badgeOptions: const BadgeOptions(
                      active: true,
                      foregroundColor: Colors.white,
                      backgroundColor: AppColors.colore20912Red,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
