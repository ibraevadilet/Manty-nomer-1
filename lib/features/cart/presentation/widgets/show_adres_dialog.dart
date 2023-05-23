import 'package:flutter/material.dart';
import 'package:manty_nomer_1/widgets/custom_text_field.dart';
import 'package:manty_nomer_1/widgets/default_button.dart';

Future<Map> showAdressDialog(BuildContext context) async {
  String adress = '';
  bool isOrdered = false;
  Map fromBottom() => {
        'isOrdered': isOrdered,
        'adress': adress,
      };
  await showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    context: context,
    builder: (context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            height: 3,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          CustomTextField(
            onChanged: (adressFrom) {
              adress = adressFrom;
            },
            hintText: 'Введите адрес',
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  onPress: () {
                    isOrdered = false;
                    Navigator.pop(context);
                  },
                  text: 'Отмена',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomButton(
                  onPress: () {
                    if (adress.isNotEmpty) {
                      isOrdered = true;
                      Navigator.pop(context);
                    }
                  },
                  text: 'Заказать',
                ),
              )
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    ),
  );
  return fromBottom();
}
