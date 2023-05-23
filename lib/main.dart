import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manty_nomer_1/routes/mobile_app_router.dart';
import 'server/service_locator.dart';
import 'theme/app_theme.dart';
import 'widgets/app_scroll_behavior.dart';
import 'widgets/init_widget.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
final appRouter = sl<AppRouter>();

void main() async {
  await init();
  runApp(
    const ProviderScope(
      child: Main(),
    ),
  );
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: Builder(
        builder: (context) => MaterialApp.router(
          scrollBehavior: AppScrollBehavior(),
          scaffoldMessengerKey: scaffoldKey,
          theme: lightTheme,
          title: 'Manty nomer 1',
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter.config(),
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
        ),
      ),
    );
  }
}
