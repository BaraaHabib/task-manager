
import 'package:task_master_repo/task_manager_repo.dart';
import 'package:task_master_storage/task_master_storage.dart';

extension AuthExt on TaskMasterStorage{

  LogInModel get getParsedUserData{
    return LogInModel.fromJson(getUserData ?? {},);
  }

}
