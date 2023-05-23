import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manty_nomer_1/core/images/app_images.dart';
import 'package:manty_nomer_1/features/splash/splash_cubit/splash_cubit.dart';
import 'package:manty_nomer_1/routes/mobile_app_router.gr.dart';
import 'package:manty_nomer_1/server/service_locator.dart';
import 'package:manty_nomer_1/theme/app_colors.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colore20912Red,
      body: BlocProvider<SplashCubit>(
        create: (context) => sl<SplashCubit>(),
        child: BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state) {
            state.whenOrNull(
              authenticated: () => context.router.pushAndPopUntil(
                BottomNavigatorRoute(),
                predicate: (route) => false,
              ),
              unauthenticated: () => context.router.pushAndPopUntil(
                const MenuRoute(),
                predicate: (route) => false,
              ),
            );
          },
          builder: (context, state) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Image.asset(
                  AppImages.appLogo,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
