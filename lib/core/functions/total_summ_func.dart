import 'package:manty_nomer_1/features/cart/data/cart_model.dart';

int totalSumm(List<CartModel> products) {
  int summ = 0;
  for (var e in products) {
    summ += e.product.price * e.count;
  }
  return summ;
}
