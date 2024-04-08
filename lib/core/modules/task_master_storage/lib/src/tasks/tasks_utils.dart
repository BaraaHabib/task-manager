part of '../task_master_storage.dart';

/// methods to manipulate app state data
mixin TasksStorageMixin{

  /// get tasks
  Map<String, dynamic>? get getTasks {
    final sJson = TaskMasterStorage.tasks.get(_tasks,) as String?;
    if (sJson is String) {
      return json.decode(sJson) as Map<String, dynamic>;
    }
    return null;
  }

  /// set session token
  Future<void> setTasks(String? tasks) async =>
      TaskMasterStorage.tasks.put(_tasks, tasks);

}
