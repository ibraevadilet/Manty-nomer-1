import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manty_nomer_1/core/cubits/bottom_navigator_cubit/bottom_navigator_cubit.dart';
import 'package:manty_nomer_1/features/cart/presentation/cart_screen.dart';
import 'package:manty_nomer_1/features/menu/presentation/menu_screen/menu_screen.dart';
import 'package:manty_nomer_1/features/orders/presentation/orders/orders_screen.dart';
import 'package:manty_nomer_1/features/profile/presentation/profile_screen.dart';
import 'package:manty_nomer_1/theme/app_colors.dart';

@RoutePage()
class BottomNavigatorScreen extends StatefulWidget {
  const BottomNavigatorScreen({
    Key? key,
    this.pageIndex = 0,
  }) : super(key: key);
  final int pageIndex;

  @override
  State<BottomNavigatorScreen> createState() => _BottomNavigatorScreenState();
}

class _BottomNavigatorScreenState extends State<BottomNavigatorScreen> {
  late int currentIndex = widget.pageIndex;
  @override
  void initState() {
    super.initState();
    context.read<BottomNavigatorCubit>().getCurrentPage(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigatorCubit, BottomNavigatorState>(
      builder: (context, state) {
        return Scaffold(
          body: pages[state.index],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
            child: BottomNavigationBar(
              backgroundColor: AppColors.colore20912Red,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white.withOpacity(0.5),
              unselectedFontSize: 12,
              selectedLabelStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
              currentIndex: state.index,
              onTap: (index) {
                context.read<BottomNavigatorCubit>().getCurrentPage(index);
              },
              items: [
                BottomNavigationBarItem(
                  activeIcon: const Icon(
                    Icons.menu_book,
                    color: Colors.white,
                  ),
                  icon: Icon(
                    Icons.menu_book,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  label: 'Меню',
                ),
                BottomNavigationBarItem(
                  activeIcon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  label: 'Корзина',
                ),
                BottomNavigationBarItem(
                  activeIcon: const Icon(
                    Icons.delivery_dining_outlined,
                    color: Colors.white,
                  ),
                  icon: Icon(
                    Icons.delivery_dining_outlined,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  label: 'Заказы',
                ),
                BottomNavigationBarItem(
                  activeIcon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  icon: Icon(
                    Icons.person,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  label: 'Профиль',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

List<Widget> pages = [
  const MenuScreen(),
  const CartScreen(),
  const OrdersScreen(),
  const ProfileScreen(),
];
