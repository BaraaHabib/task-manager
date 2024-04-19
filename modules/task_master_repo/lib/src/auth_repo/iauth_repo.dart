

import 'package:task_master_repo/src/abstractions/base_api_model.dart';
import 'package:task_master_repo/src/auth_repo/models/log_in_model.dart';

///
// ignore: one_member_abstracts
abstract class IAuthRepo {

  /// log in
  Future<ApiResponseModel<LogInModel>> logIn(
      {required String userName, required String password,});
}
