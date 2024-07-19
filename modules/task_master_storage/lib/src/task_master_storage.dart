// ignore_for_file: inference_failure_on_function_invocation, strict_raw_type
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'constants.dart';
part 'tasks/tasks_utils.dart';

/// {@template task_master_storage}
/// Module to hold cash storage
/// {@endtemplate}
class TaskMasterStorage  {
  /// {@macro task_master_storage}
  TaskMasterStorage();

  ///
  TaskMasterStorage? _instance;

  /// public instance to access storage
  TaskMasterStorage get instance {
    assert(_instance != null,
    'No instance of TaskMasterStorage was initialized.',);
    return _instance!;
  }

  /// get session data, user info etc ..
  Box get appState => Hive.box(_stateBox);

  /// get tasks
  Box get tasks => Hive.box(_tasksBox);

  /// initialize [TaskMasterStorage]
  Future<TaskMasterStorage> init() async {
    final appDir = await getApplicationDocumentsDirectory();
    Hive.init(appDir.path);
    await Hive.openBox(_stateBox);
    await Hive.openBox(_tasksBox);
    _instance = TaskMasterStorage();
    return _instance!;
  }


  /// get session data as json
  Map<String, dynamic>? get getUserData {
    final sJson = appState.get(_tasks,) as String?;
    if (sJson is String) {
      return json.decode(sJson) as Map<String, dynamic>;
    }
    return null;
  }

  /// set session token
  Future<void> setUserData(String? data) async =>
      appState.put(_token, data);

}
