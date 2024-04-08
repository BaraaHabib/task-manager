

import 'package:task_master_repo/src/abstractions/base_api_model.dart';
import 'package:task_master_repo/src/tasks_repo/models/task_api_model.dart';

///
// ignore: one_member_abstracts
abstract class ITasksRepo {

  /// get all tasks
  Future<ApiResponseModel<TasksApiModel>> getAll(
      {required int page, required int perPage,});
}
