import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_master/app/router/app_router.gr.dart';
import 'package:task_master/locator.dart';
import 'package:task_master_repo/task_manager_repo.dart';
import 'package:task_master_storage/task_master_storage.dart';

part 'app_state_state.dart';

class AppStateCubit extends Cubit<AppStateState> {
  AppStateCubit() : super(const AppStateState.init());

  /// log user in and set session data
  void logIn(LogInModel data) {
    Locator.storage.setUserData(
      jsonEncode(data.toJson()),
    );
    emit(
      state.copyWith(
        authenticated: true,
      ),
    );
  }

  void logOut(BuildContext context) {
    Locator.storage.setUserData(
      null,
    );
    context.router.popAndPush(const LoginPage());
  }
}
