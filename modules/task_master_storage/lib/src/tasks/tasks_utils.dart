part of '../task_master_storage.dart';

/// methods to manipulate app state data
extension TasksStorageMixin on TaskMasterStorage{

  /// get tasks
  Map<String, dynamic>? getTasks(int page) {
    final sJson = tasks.get('$_tasks$page',) as String?;
    if (sJson is String) {
      return json.decode(sJson) as Map<String, dynamic>;
    }
    return null;
  }

  /// set tasks
  Future<void> setTasks(int page, String? tasks) async =>
      this.tasks.put('$_tasks$page', tasks);

}
