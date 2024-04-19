import 'package:task_master_repo/src/abstractions/base_params_model.dart';

/// {@template login_params}
/// login api requests parameters
/// {@endtemplate}
class LogInParams extends ParamsModel<LogInParamsBody> {

  /// {@macro login_params}
  const LogInParams({super.body});

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.post;

  @override
  String? get url => 'login';

  @override
  Map<String, String> get urlParams => {};

  @override
  List<Object?> get props => [url, urlParams, requestType, body];
}

/// {@template login_params_body}
/// {@endtemplate}
class LogInParamsBody extends BaseBodyModel {

  /// {@macro login_params_body}
  LogInParamsBody({
    this.userName,
    this.password,
  });

  ///
  final String? userName;

  ///
  final String? password;

  @override
  Map<String, dynamic> toJson() => {
    'username': userName,
    'password': password,
  };
}
