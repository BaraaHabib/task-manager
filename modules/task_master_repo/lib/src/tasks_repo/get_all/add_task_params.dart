import 'package:task_master_repo/src/abstractions/base_params_model.dart';

/// {@template get_all_tasks_params}
/// Auth repo responsible for authenticating users
/// {@endtemplate}
class AddTaskParams extends ParamsModel<AddTaskParamsBody> {

  /// {@macro login_params}
  const AddTaskParams({super.body});

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.get;

  @override
  String? get url => 'resources';

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

/// {@template get_all_params_body}
/// Auth repo responsible for authenticating users
/// {@endtemplate}
class AddTaskParamsBody extends BaseBodyModel {

  /// {@macro get_all_params_body}
  AddTaskParamsBody();

  @override
  Map<String, dynamic> toJson() => { };
}
