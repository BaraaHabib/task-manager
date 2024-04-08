part of '../task_master_storage.dart';

/// methods to manipulate app state data
mixin AppStateStorageMixin{

  /// get session token
  String? get getToken =>
      TaskMasterStorage.appState.get(_token,) as String?;

  /// set session token
  Future<void> setToken(String? token) async =>
      TaskMasterStorage.appState.put(_token, token);

}
