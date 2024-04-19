import 'package:task_master_repo/src/abstractions/base_params_model.dart';

/// {@template get_all_tasks_params}
/// Auth repo responsible for authenticating users
/// {@endtemplate}
class GetAllTasksParams extends ParamsModel<GetAllTasksParamsBody> {

  /// {@macro login_params}
  const GetAllTasksParams({super.body});

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
class GetAllTasksParamsBody extends BaseBodyModel {

  /// {@macro get_all_params_body}
  GetAllTasksParamsBody();

  @override
  Map<String, dynamic> toJson() => { };
}
