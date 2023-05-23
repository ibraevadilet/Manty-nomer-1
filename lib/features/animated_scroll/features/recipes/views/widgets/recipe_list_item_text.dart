import 'package:flutter/material.dart';
import 'package:manty_nomer_1/features/animated_scroll/core/enums/screen_size.dart';
import 'package:manty_nomer_1/theme/app_colors.dart';
import 'package:manty_nomer_1/features/animated_scroll/features/recipes/views/widgets/recipe_list_item_text_wrapper.dart';
import 'package:manty_nomer_1/features/menu/data/models/manty_model.dart';

class MenuListItemText extends StatelessWidget {
  const MenuListItemText(
    this.manty, {
    Key? key,
  }) : super(key: key);

  final MantyModel manty;

  @override
  Widget build(BuildContext context) {
    return MenuListItemTextWrapper(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: ScreenSize.of(context).isLarge ? 40 : 20,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: ScreenSize.of(context).isLarge
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: [
            Hero(
              tag: '__recipe_${manty.id}_title__',
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  manty.title,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: AppColors.textColorFromBackground(
                          Colors.white,
                        ),
                      ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Flexible(
              child: Hero(
                tag: '__recipe_${manty.id}_price__',
                child: Text(
                  '${manty.price} сом',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.textColorFromBackground(Colors.white),
                      ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
