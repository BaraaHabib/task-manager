import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_master/locator.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.loading());

  Future<void> init() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        final token = Locator.storage.getToken;
        if (token != null) {
          emit(
            const SplashState.authenticated(),
          );
        } else {
          emit(
            const SplashState.unauthenticated(),
          );
        }
      },
    );
  }
}
