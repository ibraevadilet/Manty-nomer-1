import 'package:flutter/material.dart';
import 'package:manty_nomer_1/features/animated_scroll/features/recipes/recipes_layout.dart';
import 'package:manty_nomer_1/features/animated_scroll/features/recipes/views/widgets/recipe_list_item_image_wrapper.dart';
import 'package:manty_nomer_1/features/menu/data/models/manty_model.dart';

class MenuListItemImage extends StatelessWidget {
  const MenuListItemImage(
    this.manty, {
    Key? key,
    this.imageRotationAngle = 0,
  }) : super(key: key);

  final MantyModel manty;
  final double imageRotationAngle;

  @override
  Widget build(BuildContext context) {
    double imageSize = RecipesLayout.of(context).recipeImageSize;

    return MenuListItemImageWrapper(
      child: Hero(
        tag: '__recipe_${manty.id}_image__',
        child: Transform.rotate(
          angle: imageRotationAngle,
          child: Image.asset(
            manty.image,
            width: imageSize,
          ),
        ),
      ),
    );
  }
}
