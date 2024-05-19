import 'package:task_master_repo/src/abstractions/base_params_model.dart';

/// {@template add_tasks_params}
/// add task api parameters
/// provide [id] when updating a task
/// {@endtemplate}
class AddUpdateTaskParams extends ParamsModel<AddTaskParamsBody> {

  /// {@macro add_tasks_params}
  const AddUpdateTaskParams({this.id, super.body});

  /// send task id when we are updating a task
  final int? id;

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType {
    if(id != null) {
      return RequestType.put;
    }
    return RequestType.post;
  }

  @override
  String? get url {
    var url = 'todos/add';
    if(id != null) {
      url = 'todos/$id';
    }
    return url;
  }

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

/// {@template get_all_params_body}
/// add to do api post body parameters
/// {@endtemplate}
class AddTaskParamsBody extends BaseBodyModel {

  /// {@macro get_all_params_body}
  AddTaskParamsBody({
    required this.todo,
    required this.completed,
    required this.userId,
  });

  /// task name
  final String todo;

  /// is task completed
  final bool completed;

  /// is user task id
  final int userId;

  @override
  Map<String, dynamic> toJson() =>
      {
        'todo': todo,
        'completed': completed,
        'userId': userId,
      };
}
