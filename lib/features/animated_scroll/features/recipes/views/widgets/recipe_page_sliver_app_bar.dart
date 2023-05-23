import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manty_nomer_1/theme/app_colors.dart';
import 'package:manty_nomer_1/features/animated_scroll/core/widgets/adaptive_offset_effect.dart';
import 'package:manty_nomer_1/features/animated_scroll/core/widgets/app_bar_leading.dart';
import 'package:manty_nomer_1/features/animated_scroll/core/widgets/fade_in_effect.dart';
import 'package:manty_nomer_1/features/animated_scroll/features/recipes/views/widgets/recipe_image.dart';
import 'package:manty_nomer_1/features/animated_scroll/features/recipes/views/widgets/recipe_image_pattern.dart';
import 'package:manty_nomer_1/features/animated_scroll/features/recipes/views/widgets/recipe_page_image_bg.dart';
import 'package:manty_nomer_1/features/menu/data/models/manty_model.dart';

class MenuDetailScreenSliverAppBar extends StatelessWidget {
  const MenuDetailScreenSliverAppBar({
    Key? key,
    required this.manty,
    this.expandedHeight = 340,
    this.collapsedHeight = 200,
    this.imageRotationAngle = 0,
  }) : super(key: key);

  final MantyModel manty;
  final double expandedHeight;
  final double? collapsedHeight;
  final double imageRotationAngle;

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width * 0.7;

    return SliverAppBar(
      pinned: true,
      stretch: true,
      backgroundColor: Colors.transparent,
      collapsedHeight: collapsedHeight,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: AppColors.getBrightness(Colors.white),
      ),
      leading: AppBarLeading(
        popValue: imageRotationAngle,
        bgColor: AppColors.textColorFromBackground(Colors.white),
      ),
      expandedHeight: expandedHeight + MediaQuery.of(context).padding.top,
      flexibleSpace: AdaptiveOffsetEffect.builder(
        width: MediaQuery.of(context).size.width,
        height: expandedHeight,
        child: RecipePageImageBg(
          manty,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(35),
            bottomLeft: Radius.circular(35),
          ),
        ),
        childBuilder: (BuildContext context, Offset offset, Widget? child) {
          return Stack(
            children: [
              child!,
              if (true)
                FlexibleSpaceBar(
                  background: FadeInEffect(
                    intervalStart: 0.5,
                    child: Opacity(
                      opacity: 0.6,
                      child: RecipeImagePattern(
                        offset: offset,
                        manty,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(35),
                          bottomLeft: Radius.circular(35),
                        ),
                      ),
                    ),
                  ),
                ),
              SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: RecipeImage(
                    manty,
                    imageRotationAngle: imageRotationAngle,
                    imageSize: imageSize,
                    shadowOffset: offset * 0.6,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
