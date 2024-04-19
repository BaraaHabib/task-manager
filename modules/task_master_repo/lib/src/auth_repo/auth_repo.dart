
import 'package:task_master_repo/src/abstractions/base_api_model.dart';
import 'package:task_master_repo/src/auth_repo/iauth_repo.dart';
import 'package:task_master_repo/src/auth_repo/models/log_in_model.dart';
import 'package:task_master_repo/src/auth_repo/models/log_in_params.dart';
import 'package:task_master_repo/src/resources/configuration.dart';

/// {@template auth_repo}
/// basic operations to authenticate users
/// {@endtemplate}
class AuthRepo implements IAuthRepo {

  @override
  Future<ApiResponseModel<LogInModel>> logIn(
      {required String userName, required String password,}) async {
    return networkClient.performRequest<LogInModel>(LogInParams(
      body: LogInParamsBody(
        userName: userName,
        password: password,
      ),
    ),
      parser: LogInModel.fromJson,
    );
  }

}
