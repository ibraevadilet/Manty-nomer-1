import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:manty_nomer_1/core/constants/app_text_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required this.prefs}) : super(const SplashState.initial()) {
    getAuthStatus();
  }
  final SharedPreferences prefs;

  Future<void> getAuthStatus() async {
    final authEmail = prefs.getString(SharedKeys.authEmail) ?? '';
    await Future.delayed(const Duration(seconds: 2));
    if (authEmail.isEmpty) {
      emit(const SplashState.unauthenticated());
    } else {
      emit(const SplashState.authenticated());
    }
  }
}
