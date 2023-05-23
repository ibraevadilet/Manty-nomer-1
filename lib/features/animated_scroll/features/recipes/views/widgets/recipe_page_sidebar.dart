import 'package:flutter/material.dart';
import 'package:manty_nomer_1/features/animated_scroll/core/widgets/app_bar_leading.dart';
import 'package:manty_nomer_1/features/animated_scroll/core/widgets/fade_in_effect.dart';
import 'package:manty_nomer_1/features/animated_scroll/core/widgets/adaptive_offset_effect.dart';
import 'package:manty_nomer_1/features/animated_scroll/features/recipes/views/widgets/recipe_image.dart';
import 'package:manty_nomer_1/features/animated_scroll/features/recipes/views/widgets/recipe_image_pattern_mouse.dart';
import 'package:manty_nomer_1/features/animated_scroll/features/recipes/views/widgets/recipe_page_image_bg.dart';
import 'package:manty_nomer_1/features/menu/data/models/manty_model.dart';

class MenuDetailScreenSidebar extends StatelessWidget {
  const MenuDetailScreenSidebar(
    this.manty, {
    Key? key,
    this.imageRotationAngle = 0,
  }) : super(key: key);

  final MantyModel manty;
  final double imageRotationAngle;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return AdaptiveOffsetEffect.builder(
      width: screenSize.width / 2,
      height: screenSize.height,
      childBuilder: (context, offset, _) => Stack(
        children: [
          RecipePageImageBg(
            manty,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          if (true)
            FadeInEffect(
              intervalStart: 0.5,
              child: RecipeImagePatternMouse(
                manty,
                offset: offset,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
            ),
          IgnorePointer(
            ignoring: true,
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: RecipeImage(
                  manty,
                  imageRotationAngle: imageRotationAngle,
                  shadowOffset: offset * 0.5,
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: AppBarLeading(
              text: 'Back to Recipes',
              popValue: imageRotationAngle,
            ),
          ),
        ],
      ),
    );
  }
}
