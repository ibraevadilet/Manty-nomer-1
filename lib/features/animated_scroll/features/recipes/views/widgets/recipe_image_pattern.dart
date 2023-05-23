import 'package:flutter/material.dart';
import 'package:manty_nomer_1/features/animated_scroll/core/enums/screen_size.dart';
import 'package:manty_nomer_1/theme/app_colors.dart';
import 'package:manty_nomer_1/features/menu/data/models/manty_model.dart';

class RecipeImagePattern extends StatelessWidget {
  const RecipeImagePattern(
    this.manty, {
    Key? key,
    this.offset = Offset.zero,
    required this.borderRadius,
  }) : super(key: key);

  final MantyModel manty;
  final BorderRadius borderRadius;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    AlignmentGeometry alignment = ScreenSize.of(context).isLarge
        ? Alignment.center
        : Alignment.bottomCenter;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        TweenAnimationBuilder<Offset>(
          tween: Tween<Offset>(begin: Offset.zero, end: offset * 1.5),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutBack,
          builder: (context, Offset offset, child) => Transform.translate(
            offset: offset,
            child: child!,
          ),
          child: Align(
            alignment: alignment,
            child: ClipRRect(
              borderRadius: borderRadius,
              child: Container(
                color: AppColors.red,
              ),
            ),
          ),
        ),
        TweenAnimationBuilder<Offset>(
          tween: Tween<Offset>(begin: Offset.zero, end: offset),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutBack,
          builder: (context, Offset offset, child) => Transform.translate(
            offset: offset,
            child: child!,
          ),
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Container(
              color: AppColors.red,
            ),
          ),
        ),
      ],
    );
  }
}
