import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:manty_nomer_1/core/cubits/bottom_navigator_cubit/bottom_navigator_cubit.dart';
import 'package:manty_nomer_1/features/auth/data/auth_repo.dart';
import 'package:manty_nomer_1/features/auth/domain/auth_use_case.dart';
import 'package:manty_nomer_1/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:manty_nomer_1/features/cart/data/create_order_repo.dart';
import 'package:manty_nomer_1/features/cart/data/get_cart_repo.dart';
import 'package:manty_nomer_1/features/cart/presentation/cubits/create_order_cubit/create_order_cubit.dart';
import 'package:manty_nomer_1/features/cart/presentation/cubits/get_cart_cubit/get_cart_cubit.dart';
import 'package:manty_nomer_1/features/history/data/get_history_repo.dart';
import 'package:manty_nomer_1/features/history/presentation/cubits/cubit/get_history_cubit.dart';
import 'package:manty_nomer_1/features/menu/data/repository/add_product_to_cart_repo.dart';
import 'package:manty_nomer_1/features/menu/data/repository/get_products_repo.dart';
import 'package:manty_nomer_1/features/menu/presentation/menu_detail_screen.dart/blocs/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:manty_nomer_1/features/menu/presentation/menu_screen/blocs/get_products_cubit/get_products_cubit.dart';
import 'package:manty_nomer_1/features/orders/data/repositories/get_order_detal_repo.dart';
import 'package:manty_nomer_1/features/orders/data/repositories/get_orders_repo.dart';
import 'package:manty_nomer_1/features/orders/presentation/orders/cubits/get_order_detail_cubit/get_order_detail_cubit.dart';
import 'package:manty_nomer_1/features/orders/presentation/orders/cubits/get_orders_cubit/get_orders_cubit.dart';
import 'package:manty_nomer_1/features/splash/splash_cubit/splash_cubit.dart';
import 'package:manty_nomer_1/firebase_options.dart';
import 'package:manty_nomer_1/routes/mobile_app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

// ignore: long-method
Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'Manty1',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await EasyLocalization.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  /// Other Services
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerSingleton<AppRouter>(AppRouter());

  /// Repositories
  sl.registerFactory<GetAuthRepo>(() => GetAuthRepoImpl());
  sl.registerFactory<GetProductsRepo>(() => GetProductsRepoImpl());
  sl.registerFactory<GetCartRepo>(() => GetCartRepoImpl());
  sl.registerFactory<AddToCartRepo>(() => AddToCartRepoImpl());
  sl.registerFactory<GetOrdersRepo>(() => GetOrdersRepoImpl());
  sl.registerFactory<CreateOrderRepo>(() => CreateOrderRepoImpl());
  sl.registerFactory<GetHistoryRepo>(() => GetHistoryRepoImpl());
  sl.registerFactory<GetOrderDetailRepo>(() => GetOrderDetailRepoImpl());

  /// UseCases
  sl.registerFactory<AuthUseCase>(() => AuthUseCase(sl()));

  /// BLoCs / Cubits

  sl.registerFactory<SplashCubit>(() => SplashCubit(prefs: sl()));
  sl.registerFactory(() => AuthCubit(sl()));
  sl.registerFactory<BottomNavigatorCubit>(() => BottomNavigatorCubit());
  sl.registerFactory<GetProductsCubit>(() => GetProductsCubit(sl()));
  sl.registerLazySingleton<GetCartCubit>(() => GetCartCubit(sl()));
  sl.registerLazySingleton<AddToCartCubit>(() => AddToCartCubit(sl()));
  sl.registerLazySingleton<GetOrdersCubit>(() => GetOrdersCubit(sl()));
  sl.registerFactory<CreateOrderCubit>(() => CreateOrderCubit(sl()));
  sl.registerFactory<GetHistoryCubit>(() => GetHistoryCubit(sl()));
  sl.registerLazySingleton<GetOrderDetailCubit>(
      () => GetOrderDetailCubit(sl()));
}
