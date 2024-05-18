import 'package:task_master_repo/src/abstractions/base_params_model.dart';

/// {@template get_all_tasks_params}
/// add to do api parameters
/// {@endtemplate}
class AddTaskParams extends ParamsModel<AddTaskParamsBody> {

  /// {@macro login_params}
  const AddTaskParams({super.body});

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.get;

  @override
  String? get url => 'todos/add';

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
  Map<String, dynamic> toJson() => {
    'todo' : todo,
    'completed' : completed,
    'userId' : userId,
  };
}
