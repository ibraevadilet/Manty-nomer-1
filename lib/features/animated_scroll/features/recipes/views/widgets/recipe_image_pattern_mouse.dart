import 'package:flutter/material.dart';
import 'package:manty_nomer_1/features/animated_scroll/core/enums/screen_size.dart';
import 'package:manty_nomer_1/theme/app_colors.dart';
import 'package:manty_nomer_1/features/menu/data/models/manty_model.dart';

class RecipeImagePatternMouse extends StatelessWidget {
  const RecipeImagePatternMouse(
    this.manty, {
    Key? key,
    required this.borderRadius,
    this.offset = Offset.zero,
  }) : super(key: key);

  final MantyModel manty;
  final BorderRadius borderRadius;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    AlignmentGeometry alignment = ScreenSize.of(context).isLarge
        ? Alignment.center
        : Alignment.bottomCenter;

    return Opacity(
      opacity: 0.6,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          TweenAnimationBuilder(
            tween: Tween<Offset>(begin: Offset.zero, end: offset * 2),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutBack,
            builder: (context, Offset offset, child) => Transform.translate(
              offset: offset,
              child: child,
            ),
            child: Align(
              alignment: alignment,
              child: ClipRRect(
                borderRadius: borderRadius,
              ),
            ),
          ),
          TweenAnimationBuilder(
            tween: Tween<Offset>(begin: Offset.zero, end: offset),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutBack,
            builder: (context, Offset offset, child) => Transform.translate(
              offset: offset,
              child: child,
            ),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: Container(
                color: AppColors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
