import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:task_master/app/environment/app_environment.dart';
import 'package:task_master_repo/task_manager_repo.dart';
import 'package:task_master_storage/task_master_storage.dart';

/// [Locator] is responsible for locating and registering all the
/// services of the application.
abstract final class Locator {
  /// [GetIt] instance
  @visibleForTesting
  static final instance = GetIt.instance;

  /// Returns instance of [NetworkClient]
  static NetworkClient get networkClient => instance<NetworkClient>();

  /// Returns instance of [TaskMasterStorage]
  static TaskMasterStorage get storage => instance<TaskMasterStorage>();

  /// Returns instance of [TaskManagerRepo]
  static TaskManagerRepo get repo => instance<TaskManagerRepo>();

  /// Responsible for registering all the dependencies
  static Future<void> locateServices(
      {required AppEnvironment environment,}) async {
    final taskMasterStorage = await TaskMasterStorage().init();
    instance
    // register local storage service
      ..registerLazySingleton(() => taskMasterStorage,)
    // register app repository
      ..registerLazySingleton(() =>
          TaskManagerRepo(
              withLogging: kDebugMode,
              taskMasterStorage: instance(),
              baseUrl: environment.baseUrl,
          ),
      )
    // Client Dependencies
      ..registerFactory(Dio.new);
  }
}
