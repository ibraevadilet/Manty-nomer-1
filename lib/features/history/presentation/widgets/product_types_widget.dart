import 'package:flutter/material.dart';
import 'package:manty_nomer_1/features/orders/data/models/orders_model.dart';
import 'package:manty_nomer_1/theme/app_text_styles.dart';

class ProductTypesWidget extends StatelessWidget {
  const ProductTypesWidget({
    super.key,
    this.textColor = Colors.white,
    required this.model,
  });
  final Color textColor;
  final Product model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                model.name,
                style: AppTextStyles.s14W400(
                  color: textColor,
                ),
              ),
            ),
            Expanded(
              child: Text(
                '${model.count} шт',
                textAlign: TextAlign.center,
                style: AppTextStyles.s14W400(
                  color: textColor,
                ),
              ),
            ),
            Expanded(
              child: Text(
                '${model.summa} сом',
                textAlign: TextAlign.center,
                style: AppTextStyles.s14W400(
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
