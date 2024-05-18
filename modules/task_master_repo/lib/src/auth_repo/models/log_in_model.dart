import 'package:task_master_repo/src/abstractions/base_api_model.dart';

/// {@template auth_repo}
/// Auth repo responsible for authenticating users
/// {@endtemplate}
class LogInModel extends ApiSuccessModel {

  /// {@macro auth_repo}
  const LogInModel({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.token,
  });

  /// {@macro auth_repo}
  factory LogInModel.fromJson(Map<String, dynamic> json) {
    return LogInModel(
      id: json['id'] as int?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      token: json['email'] as String?,
      firstName: json['email'] as String?,
      gender: json['email'] as String?,
      image: json['email'] as String?,
      lastName: json['email'] as String?,
    );
  }

  ///
  final int? id;

  ///
  final String? username;

  ///
  final String? email;

  ///
  final String? firstName;

  ///
  final String? lastName;

  ///
  final String? gender;

  ///
  final String? image;

  ///
  final String? token;

  ///
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['gender'] = gender;
    data['image'] = image;
    data['token'] = token;
    return data;
  }

  @override
  List<Object?> get props =>
      [
        id,
      ];

  @override
  ApiSuccessModel fromJson(Map<String, dynamic> json) =>
      LogInModel.fromJson(json);
}
