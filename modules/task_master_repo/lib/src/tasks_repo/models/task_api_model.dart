import 'package:task_master_repo/src/abstractions/base_api_model.dart';

///
class TasksApiModel extends ApiModel {

  ///
  const TasksApiModel(
      this._total,
      this._skip,
      this._limit,
      this._data,
  ) ;

  factory TasksApiModel.fromJson(Map<String, dynamic> json) {
    final tData = <TaskModel>[];
    if (json['todos'] is List) {
      // ignore: inference_failure_on_function_invocation
      final list = json['todos'] as List;
      // ignore: avoid_dynamic_calls
      for (final item in list) {
        tData.add(TaskModel.fromJson(item as Map<String, dynamic>));
      }
    }
    return TasksApiModel(
        json['total'] as int,
        json['skip'] as int,
        json['limit'] as int,
        tData,
    );
  }

  final int? _total;
  final int? _skip;
  final int? _limit;
  final List<TaskModel>? _data;

  ///
  TasksApiModel copyWith({
    int? skip,
    int? limit,
    int? total,
    int? totalPages,
    List<TaskModel>? data,
  }) =>
      TasksApiModel(
        total ?? this.total,
        skip ?? this.skip,
        limit ?? this.limit,
        data ?? this.data,
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
      map['todos'] = _data?.map((v) => v.toJson()).toList() ?? [];
    }
    return map;
  }

  @override
  ApiModel fromJson(Map<String, dynamic> json) =>
      TasksApiModel.fromJson(json);

  @override
  List<Object?> get props => [_skip, _limit, _total,];

}

/// id : 0
///       "id": 13,
///       "to Do": "Buy a new house decoration",
///      "completed": false,
///      "userId": 16

class TaskModel extends ApiModel {
  ///
  const TaskModel(
      this._id,
      this._title,
      // ignore: avoid_positional_boolean_parameters
      this._completed,
      this._userId,
      );

  ///
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      json['id'] as int?,
      json['todo'] as String?,
      json['completed'] as bool?,
      json['userId'] as int?,
    );
  }

  final int? _id;
  final String? _title;
  final bool? _completed;
  final int? _userId;

  ///
  TaskModel copyWith({
    int? id,
    String? todo,
    bool? completed,
    int? userId,
  }) =>
      TaskModel(
        id ?? _id,
        todo ?? _title,
        completed ?? _completed,
        userId ?? _userId,
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

  @override
  ApiModel fromJson(Map<String, dynamic> json) => fromJson(json,);

  @override
  List<Object?> get props => [id,title, completed,];

}
