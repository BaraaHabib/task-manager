import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_master/core/extensions/auth_extensions.dart';
import 'package:task_master_storage/task_master_storage.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    this.storage,
  }) : super(const SplashState.loading());

  TaskMasterStorage? storage;

  Future<void> init() async {
    emit(const SplashState.loading());
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        final userData =  storage?.getParsedUserData;
        if (userData?.token != null) {
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
