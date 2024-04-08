

import 'package:task_master_repo/src/abstractions/base_api_model.dart';

/// {@template auth_repo}
/// Auth repo responsible for authenticating users
/// {@endtemplate}
class LogInModel extends ApiSuccessModel {

  /// {@macro auth_repo}
  const LogInModel({
    required String token,
  }) : _token = token;

  ///
  LogInModel.fromJson(Map<String, dynamic> json)
      : _token = json['token']?.toString();

  final String? _token;

  ///
  LogInModel copyWith({
    String? token,
  }) =>
      LogInModel(
        token: token ?? _token ?? '',
      );

  ///
  String? get token => _token;

  ///
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }

  @override
  List<Object?> get props => [token,];

  @override
  ApiSuccessModel fromJson(Map<String, dynamic> json) => LogInModel.fromJson(json);
}
