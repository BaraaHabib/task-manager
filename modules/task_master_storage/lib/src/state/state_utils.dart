part of '../task_master_storage.dart';

/// methods to manipulate app state data
extension AppStateStorageMixin on TaskMasterStorage{

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
