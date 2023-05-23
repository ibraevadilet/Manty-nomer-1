import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:manty_nomer_1/features/animated_scroll/core/enums/screen_size.dart';
import 'package:manty_nomer_1/routes/mobile_app_router.gr.dart';
import 'package:manty_nomer_1/theme/app_colors.dart';
import 'package:manty_nomer_1/features/animated_scroll/features/recipes/recipes_layout.dart';
import 'package:manty_nomer_1/features/animated_scroll/features/recipes/views/widgets/recipe_image.dart';
import 'package:manty_nomer_1/features/animated_scroll/features/recipes/views/widgets/recipe_list_item_gesture_detector.dart';
import 'package:manty_nomer_1/features/animated_scroll/features/recipes/views/widgets/recipe_list_item_image_wrapper.dart';
import 'package:manty_nomer_1/features/animated_scroll/features/recipes/views/widgets/recipe_list_item_text.dart';
import 'package:manty_nomer_1/features/menu/data/models/manty_model.dart';

class MenuListItem extends StatefulWidget {
  const MenuListItem(
    this.manty, {
    Key? key,
  }) : super(key: key);

  final MantyModel manty;

  @override
  State<MenuListItem> createState() => _MenuListItemState();
}

class _MenuListItemState extends State<MenuListItem> {
  double recipeImageRotationAngle = 0;

  @override
  Widget build(BuildContext context) {
    double imageSize = RecipesLayout.of(context).recipeImageSize;

    return MenuListItemGestureDetector(
      onTap: () {
        context.router.push(
          MenuDetailRoute(
            manty: widget.manty,
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(ScreenSize.of(context).isLarge ? 15 : 12.5),
        child: Stack(
          children: [
            Positioned.fill(
              child: Hero(
                tag: '__recipe_${widget.manty.id}_image_bg__',
                child: Container(
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFF1100).withOpacity(
                          AppColors.getBrightness(Colors.white) ==
                                  Brightness.dark
                              ? 0.5
                              : 0.2,
                        ),
                        blurRadius: 10,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                alignment: Alignment.bottomRight,
                child: MenuListItemImageWrapper(
                  child: RecipeImage(
                    widget.manty,
                    imageRotationAngle: recipeImageRotationAngle,
                    imageSize: imageSize,
                    alignment: Alignment.bottomRight,
                    hasShadow: false,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: MenuListItemText(widget.manty),
                ),
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
