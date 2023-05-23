import 'package:auto_route/auto_route.dart';
import 'package:manty_nomer_1/routes/mobile_app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: BottomNavigatorRoute.page),
        AutoRoute(page: MenuDetailRoute.page),
        AutoRoute(page: AboutCompanyRoute.page),
        AutoRoute(page: HistoryRoute.page),
        AutoRoute(page: OrdersDetailRoute.page),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: MenuRoute.page),
        AutoRoute(page: EditProfileRoute.page),
      ];
}
