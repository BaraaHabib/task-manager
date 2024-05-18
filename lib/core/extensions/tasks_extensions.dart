
import 'package:task_master_repo/task_manager_repo.dart';
import 'package:task_master_storage/task_master_storage.dart';

extension TasksExt on TaskMasterStorage{

  TasksApiModel? getParsedTasks(int page) {
    final jsonData = getTasks(page);
    if(jsonData != null){
      return TasksApiModel.fromJson(jsonData,);
    }
    return null;
  }

}
