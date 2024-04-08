// ignore_for_file: inference_failure_on_function_invocation, strict_raw_type
import 'package:hive_flutter/hive_flutter.dart';

part 'constants.dart';
part 'state/state_utils.dart';

/// {@template task_master_storage}
/// Module to hold cash storage
/// {@endtemplate}
class TaskMasterStorage with AppStateStorageMixin {
  /// {@macro task_master_storage}
  TaskMasterStorage();

  ///
  static TaskMasterStorage? _instance;

  /// public instance to access storage
  static TaskMasterStorage get instance {
    assert(_instance != null,
    'No instance of TaskMasterStorage was initialized.',);
    return _instance!;
  }

  /// get session data, user info etc ..
  static Box get appState => Hive.box(_stateBox);

  /// initialize [TaskMasterStorage]
  static Future<TaskMasterStorage> init() async {
    await Hive.initFlutter();
    await Hive.openBox(_stateBox);
    _instance = TaskMasterStorage();
    return _instance!;
  }
}
