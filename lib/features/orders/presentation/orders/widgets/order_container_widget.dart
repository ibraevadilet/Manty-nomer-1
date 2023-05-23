import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:manty_nomer_1/features/history/presentation/widgets/product_types_widget.dart';
import 'package:manty_nomer_1/features/orders/data/models/orders_model.dart';
import 'package:manty_nomer_1/routes/mobile_app_router.gr.dart';
import 'package:manty_nomer_1/theme/app_colors.dart';
import 'package:manty_nomer_1/theme/app_text_styles.dart';
import 'package:manty_nomer_1/widgets/default_button.dart';
import 'package:manty_nomer_1/widgets/spaces.dart';

class OrderContainerWidget extends StatelessWidget {
  const OrderContainerWidget({
    super.key,
    required this.model,
  });
  final OrdersModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (model.isMap) {
          context.router.push(
            OrdersDetailRoute(orderId: model.id),
          );
        }
      },
      child: Container(
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
            const SizedBox(height: 18),
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
            Visibility(
              visible: model.courier.isNotEmpty,
              child: Text(
                'Курьер: ${model.courier}',
                style: AppTextStyles.s15W600(
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              'Адрес доставки: ${model.adres}',
              style: AppTextStyles.s15W600(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Статус:',
                    style: AppTextStyles.s15W600(
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: model.status == 'В пути'
                          ? AppColors.green2BB402
                          : Colors.amber.shade800,
                    ),
                    child: Text(
                      model.status,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.s15W600(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            Visibility(
              visible: model.isMap,
              child: CustomButton(
                color: AppColors.green2BB402,
                onPress: () {
                  context.router.push(
                    OrdersDetailRoute(orderId: model.id),
                  );
                },
                text: 'Посмотреть на карте',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
