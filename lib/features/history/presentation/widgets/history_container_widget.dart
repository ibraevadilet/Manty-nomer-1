import 'package:flutter/material.dart';
import 'package:manty_nomer_1/features/history/presentation/widgets/product_types_widget.dart';
import 'package:manty_nomer_1/features/orders/data/models/orders_model.dart';
import 'package:manty_nomer_1/theme/app_colors.dart';
import 'package:manty_nomer_1/theme/app_text_styles.dart';
import 'package:manty_nomer_1/widgets/spaces.dart';

class HistoryContainerWidget extends StatelessWidget {
  const HistoryContainerWidget({
    super.key,
    required this.model,
  });
  final OrdersModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: getWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.colore20912Red,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Заказ номер 11',
            style: AppTextStyles.s19W400(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          const SizedBox(height: 12),
          Column(
            children: model.products
                .map<Widget>((e) => ProductTypesWidget(
                      model: e,
                    ))
                .toList(),
          ),
          const SizedBox(height: 12),
          Text(
            'Общая сумма: ${model.totalAmount} сом',
            style: AppTextStyles.s15W600(
              color: Colors.white,
            ),
          ),
          Text(
            'Время заказа: ${model.time}',
            style: AppTextStyles.s15W600(
              color: Colors.white,
            ),
          ),
          Text(
            'Время доставки: ${model.deliverytime}',
            style: AppTextStyles.s15W600(
              color: Colors.white,
            ),
          ),
          Text(
            'Курьер: ${model.courier}',
            style: AppTextStyles.s15W600(
              color: Colors.white,
            ),
          ),
          Text(
            'Адрес доставки: ${model.adres}',
            style: AppTextStyles.s15W600(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
