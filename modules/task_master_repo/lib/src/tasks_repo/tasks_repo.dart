
import 'package:task_master_repo/src/abstractions/base_api_model.dart';
import 'package:task_master_repo/src/resources/configuration.dart';
import 'package:task_master_repo/src/tasks_repo/get_all/get_all_params.dart';
import 'package:task_master_repo/src/tasks_repo/itasks_repo.dart';
import 'package:task_master_repo/src/tasks_repo/models/task_api_model.dart';

/// {@template auth_repo}
/// basic operations to authenticate users
/// {@endtemplate}
class TasksRepo implements ITasksRepo {

  @override
  Future<ApiResponseModel<TasksApiModel>> getAll({
    required int page,
    required int perPage,
  }) {
    return networkClient.performRequest<TasksApiModel>(
      const GetAllTasksParams(),
      parser: TasksApiModel.fromJson,
    );
  }

}
