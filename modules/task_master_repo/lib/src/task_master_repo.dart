import 'package:dio/dio.dart';
import 'package:task_master_repo/src/auth_repo/auth_repo.dart';
import 'package:task_master_repo/src/auth_repo/iauth_repo.dart';
import 'package:task_master_repo/src/network/network_client.dart';
import 'package:task_master_repo/src/resources/configuration.dart';
import 'package:task_master_repo/src/tasks_repo/itasks_repo.dart';
import 'package:task_master_repo/src/tasks_repo/tasks_repo.dart';
import 'package:task_master_storage/task_master_storage.dart';

/// {@template task_manager_repo}
/// Module that holds api repositories and api connection layer
/// {@endtemplate}
class TaskManagerRepo {
  /// {@macro task_manager_repo}
  TaskManagerRepo({
    required String baseUrl,
    bool withLogging = false,
    TaskMasterStorage? taskMasterStorage,
  }) {
    logging = withLogging;
    storage = taskMasterStorage;
    networkClient = NetworkClient(dio: Dio(),baseUrl: baseUrl);
  }

  /// access authentication repo
  final IAuthRepo auth = AuthRepo();

  /// access and manipulate tasks
  final ITasksRepo tasks = TasksRepo();
}
