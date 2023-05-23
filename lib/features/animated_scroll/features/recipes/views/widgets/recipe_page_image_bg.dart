import 'package:flutter/material.dart';
import 'package:manty_nomer_1/theme/app_colors.dart';
import 'package:manty_nomer_1/features/menu/data/models/manty_model.dart';

class RecipePageImageBg extends StatelessWidget {
  const RecipePageImageBg(
    this.manty, {
    Key? key,
    required this.borderRadius,
  }) : super(key: key);

  final MantyModel manty;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '__recipe_${manty.id}_image_bg__',
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: AppColors.orangeDark.withOpacity(
                AppColors.getBrightness(Colors.white) == Brightness.dark
                    ? 0.5
                    : 0.2,
              ),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
