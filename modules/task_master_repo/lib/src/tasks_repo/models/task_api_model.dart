import 'package:task_master_repo/src/abstractions/base_api_model.dart';

///
class TasksApiModel extends ApiSuccessModel {

  ///
  TasksApiModel({
    int skip = 1,
    int limit = 10,
    int total = 0,
    List<TaskModel> data = const [],
  }) {
    _skip = skip;
    _limit = limit;
    _total = total;
    _data = data;
  }

  TasksApiModel.fromJson(Map<String, dynamic> json) {
    _skip = json['skip'] as int;
    _limit = json['limit'] as int;
    _total = json['total'] as int;
    if (json['data'] is List) {
      // ignore: inference_failure_on_function_invocation
      final list = json['data'] as List;
      _data = [];
      // ignore: avoid_dynamic_calls
      for(final item in list){
        _data?.add(TaskModel.fromJson(item as Map<String, dynamic>));
      }
    }
  }

  late final int? _total;
  late final int? _skip;
  late final int? _limit;
  late final List<TaskModel>? _data;

  ///
  TasksApiModel copyWith({
    int? skip,
    int? limit,
    int? total,
    int? totalPages,
    List<TaskModel>? data,
  }) =>
      TasksApiModel(
        skip: skip ?? this.skip,
        total: total ?? this.total,
        limit: limit ?? this.limit,
        data: data ?? this.data,
      );

  ///
  int get skip => _skip ?? 0;

  ///
  int get limit => _limit ?? 0;

  ///
  int get total => _total ?? 0;

  ///
  List<TaskModel> get data => _data ?? [];

  ///
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['skip'] = _skip;
    map['limit'] = _limit;
    map['total'] = _total;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList() ?? [];
    }
    return map;
  }

  @override
  ApiSuccessModel fromJson(Map<String, dynamic> json) =>
      TasksApiModel.fromJson(json);

  @override
  List<Object?> get props => [_skip, _limit, _total,];

}

/// id : 0
///       "id": 13,
///       "to Do": "Buy a new house decoration",
///      "completed": false,
///      "userId": 16

class TaskModel {
  ///
  TaskModel({
    int? id,
    String? todo,
    bool? completed,
    int? userId,
  }) {
    _id = id;
    _title = todo;
    _completed = completed;
    _userId = userId;
  }

  ///
  TaskModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'] as int?;
    _title = json['todo'] as String?;
    _completed = json['completed'] as bool?;
    _userId = json['userId'] as int?;
  }

  int? _id;
  String? _title;
  bool? _completed;
  int? _userId;

  ///
  TaskModel copyWith({
    int? id,
    String? todo,
    bool? completed,
    int? userId,
  }) =>
      TaskModel(
        id: id ?? _id,
        todo: todo ?? _title,
        completed: completed ?? _completed,
        userId: userId ?? _userId,
      );

  ///
  int get id => _id ?? 0;

  ///
  String get title => _title ?? '';

  ///
  bool get completed => _completed ?? false;

  ///
  int get userId => _userId ?? -1;

  ///
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['todo'] = _title;
    map['completed'] = _completed;
    map['userId'] = _userId;
    return map;
  }

}
