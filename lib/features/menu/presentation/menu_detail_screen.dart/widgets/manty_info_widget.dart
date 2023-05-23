import 'package:flutter/material.dart';
import 'package:manty_nomer_1/features/menu/data/models/manty_model.dart';
import 'package:manty_nomer_1/theme/app_colors.dart';

class MantyInfoWidget extends StatelessWidget {
  const MantyInfoWidget({
    super.key,
    required this.manty,
  });

  final MantyModel manty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Hero(
                  tag: '__recipe_${manty.id}_title__',
                  child: Text(
                    manty.title,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
              ),
              Hero(
                tag: '__recipe_${manty.id}_price__',
                child: Text(
                  '${manty.price} сом',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: AppColors.colore20912Red,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            manty.description,
            style: Theme.of(context).textTheme.bodyMedium!,
          ),
        ],
      ),
    );
  }
}
