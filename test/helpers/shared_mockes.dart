
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task_master_storage/task_master_storage.dart';

class MockTaskMasterStorage extends Mock implements TaskMasterStorage {}
class MockHiveStorage extends Mock implements Box<dynamic> {}
// class AppStaCub extends Mock implements Box<dynamic> {}
