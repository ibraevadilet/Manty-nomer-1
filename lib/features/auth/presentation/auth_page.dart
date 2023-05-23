import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:manty_nomer_1/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:manty_nomer_1/routes/mobile_app_router.gr.dart';
import 'package:manty_nomer_1/server/service_locator.dart';
import 'package:manty_nomer_1/theme/app_colors.dart';
import 'package:manty_nomer_1/theme/app_text_styles.dart';

import 'package:manty_nomer_1/widgets/app_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manty_nomer_1/widgets/custom_app_bar.dart';
import 'package:manty_nomer_1/widgets/default_button.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final String authType = Platform.isAndroid ? 'Google аккаунт' : 'Apple ID';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Авторизация'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Для заказа блюд требуется выполнить вход через $authType',
                textAlign: TextAlign.center,
                style: AppTextStyles.s20W700(
                  color: AppColors.colore20912Red,
                ),
              ),
              const SizedBox(height: 12),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  state.whenOrNull(
                    loaded: (user) => context.router.pushAndPopUntil(
                      BottomNavigatorRoute(),
                      predicate: (route) => false,
                    ),
                    loading: () => showDialog(
                      context: context,
                      builder: (context) => const AppIndicator(),
                    ),
                  );
                },
                builder: (context, state) => CustomButton(
                  onPress: () {
                    context.read<AuthCubit>().getAuth();
                  },
                  text: 'Войти',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
