// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:manty_nomer_1/features/auth/presentation/auth_page.dart' as _i2;
import 'package:manty_nomer_1/features/history/presentation/history_screen.dart'
    as _i7;
import 'package:manty_nomer_1/features/menu/data/models/manty_model.dart'
    as _i12;
import 'package:manty_nomer_1/features/menu/presentation/menu_detail_screen.dart/menu_detail_screen.dart'
    as _i6;
import 'package:manty_nomer_1/features/menu/presentation/menu_screen/menu_screen.dart'
    as _i5;
import 'package:manty_nomer_1/features/orders/presentation/order_detail/orders_detail_screen.dart'
    as _i8;
import 'package:manty_nomer_1/features/profile/presentation/about_company_screen.dart'
    as _i4;
import 'package:manty_nomer_1/features/profile/presentation/edit_profile_screen.dart'
    as _i3;
import 'package:manty_nomer_1/features/splash/splash_screen.dart' as _i1;
import 'package:manty_nomer_1/widgets/bottom_navigator.dart' as _i9;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthScreen(),
      );
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.EditProfileScreen(
          key: args.key,
          image: args.image,
          name: args.name,
        ),
      );
    },
    AboutCompanyRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AboutCompanyScreen(),
      );
    },
    MenuRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MenuScreen(),
      );
    },
    MenuDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MenuDetailRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.MenuDetailScreen(
          manty: args.manty,
          key: args.key,
        ),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HistoryScreen(),
      );
    },
    OrdersDetailRoute.name: (routeData) {
      final args = routeData.argsAs<OrdersDetailRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.OrdersDetailScreen(
          key: args.key,
          orderId: args.orderId,
        ),
      );
    },
    BottomNavigatorRoute.name: (routeData) {
      final args = routeData.argsAs<BottomNavigatorRouteArgs>(
          orElse: () => const BottomNavigatorRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.BottomNavigatorScreen(
          key: args.key,
          pageIndex: args.pageIndex,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i10.PageRouteInfo<void> {
  const AuthRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EditProfileScreen]
class EditProfileRoute extends _i10.PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({
    _i11.Key? key,
    required String image,
    required String name,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          EditProfileRoute.name,
          args: EditProfileRouteArgs(
            key: key,
            image: image,
            name: name,
          ),
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const _i10.PageInfo<EditProfileRouteArgs> page =
      _i10.PageInfo<EditProfileRouteArgs>(name);
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({
    this.key,
    required this.image,
    required this.name,
  });

  final _i11.Key? key;

  final String image;

  final String name;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key, image: $image, name: $name}';
  }
}

/// generated route for
/// [_i4.AboutCompanyScreen]
class AboutCompanyRoute extends _i10.PageRouteInfo<void> {
  const AboutCompanyRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AboutCompanyRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutCompanyRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MenuScreen]
class MenuRoute extends _i10.PageRouteInfo<void> {
  const MenuRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MenuDetailScreen]
class MenuDetailRoute extends _i10.PageRouteInfo<MenuDetailRouteArgs> {
  MenuDetailRoute({
    required _i12.MantyModel manty,
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          MenuDetailRoute.name,
          args: MenuDetailRouteArgs(
            manty: manty,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MenuDetailRoute';

  static const _i10.PageInfo<MenuDetailRouteArgs> page =
      _i10.PageInfo<MenuDetailRouteArgs>(name);
}

class MenuDetailRouteArgs {
  const MenuDetailRouteArgs({
    required this.manty,
    this.key,
  });

  final _i12.MantyModel manty;

  final _i11.Key? key;

  @override
  String toString() {
    return 'MenuDetailRouteArgs{manty: $manty, key: $key}';
  }
}

/// generated route for
/// [_i7.HistoryScreen]
class HistoryRoute extends _i10.PageRouteInfo<void> {
  const HistoryRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.OrdersDetailScreen]
class OrdersDetailRoute extends _i10.PageRouteInfo<OrdersDetailRouteArgs> {
  OrdersDetailRoute({
    _i11.Key? key,
    required String orderId,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          OrdersDetailRoute.name,
          args: OrdersDetailRouteArgs(
            key: key,
            orderId: orderId,
          ),
          initialChildren: children,
        );

  static const String name = 'OrdersDetailRoute';

  static const _i10.PageInfo<OrdersDetailRouteArgs> page =
      _i10.PageInfo<OrdersDetailRouteArgs>(name);
}

class OrdersDetailRouteArgs {
  const OrdersDetailRouteArgs({
    this.key,
    required this.orderId,
  });

  final _i11.Key? key;

  final String orderId;

  @override
  String toString() {
    return 'OrdersDetailRouteArgs{key: $key, orderId: $orderId}';
  }
}

/// generated route for
/// [_i9.BottomNavigatorScreen]
class BottomNavigatorRoute
    extends _i10.PageRouteInfo<BottomNavigatorRouteArgs> {
  BottomNavigatorRoute({
    _i11.Key? key,
    int pageIndex = 0,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          BottomNavigatorRoute.name,
          args: BottomNavigatorRouteArgs(
            key: key,
            pageIndex: pageIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'BottomNavigatorRoute';

  static const _i10.PageInfo<BottomNavigatorRouteArgs> page =
      _i10.PageInfo<BottomNavigatorRouteArgs>(name);
}

class BottomNavigatorRouteArgs {
  const BottomNavigatorRouteArgs({
    this.key,
    this.pageIndex = 0,
  });

  final _i11.Key? key;

  final int pageIndex;

  @override
  String toString() {
    return 'BottomNavigatorRouteArgs{key: $key, pageIndex: $pageIndex}';
  }
}
