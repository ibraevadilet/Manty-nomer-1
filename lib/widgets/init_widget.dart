import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manty_nomer_1/core/cubits/bottom_navigator_cubit/bottom_navigator_cubit.dart';
import 'package:manty_nomer_1/features/cart/presentation/cubits/get_cart_cubit/get_cart_cubit.dart';
import 'package:manty_nomer_1/features/menu/presentation/menu_detail_screen.dart/blocs/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:manty_nomer_1/features/orders/presentation/orders/cubits/get_order_detail_cubit/get_order_detail_cubit.dart';
import 'package:manty_nomer_1/features/orders/presentation/orders/cubits/get_orders_cubit/get_orders_cubit.dart';
import 'package:manty_nomer_1/server/service_locator.dart';
import 'package:manty_nomer_1/translations/codegen_loader.g.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      assetLoader: const CodegenLoader(),
      path: 'assets/translations',
      supportedLocales: const [
        Locale('ru'),
        Locale('ky'),
      ],
      fallbackLocale: const Locale('ru'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<BottomNavigatorCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<GetCartCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<GetOrdersCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<AddToCartCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<GetOrderDetailCubit>(),
          ),
        ],
        child: child,
      ),
    );
  }
}
