import 'package:task_master_repo/src/abstractions/base_api_model.dart';

/// page : 0
/// per_page : 0
/// total : 0
/// total_pages : 0
/// data : [{"id":0,"name":"string","year":0,"color":"string","pantone_value":"string"}]

///
class TasksApiModel extends ApiSuccessModel {

  ///
  TasksApiModel({
    num page = 1,
    num perPage = 10,
    num total = 0,
    num totalPages = 0,
    List<TaskModel> data = const [],
  }) {
    _page = page;
    _perPage = perPage;
    _total = total;
    _totalPages = totalPages;
    _data = data;
  }

  TasksApiModel.fromJson(Map<String, dynamic> json) {
    _page = json['page'] as num;
    _perPage = json['per_page'] as num;
    _total = json['total'] as num;
    _totalPages = json['total_pages'] as num;
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

  late final num? _page;
  late final num? _perPage;
  late final num? _total;
  late final num? _totalPages;
  late final List<TaskModel>? _data;

  ///
  TasksApiModel copyWith({
    num? page,
    num? perPage,
    num? total,
    num? totalPages,
    List<TaskModel>? data,
  }) =>
      TasksApiModel(page: page ?? _page!,
        perPage: perPage ?? _perPage!,
        total: total ?? _total!,
        totalPages: totalPages ?? _totalPages!,
        data: data ?? _data!,
      );

  ///
  num get page => _page ?? 1;

  ///
  num get perPage => _perPage ?? 10;

  ///
  num get total => _total ?? 0;

  ///
  num get totalPages => _totalPages ?? 0;

  ///
  List<TaskModel> get data => _data ?? [];

  ///
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    map['per_page'] = _perPage;
    map['total'] = _total;
    map['total_pages'] = _totalPages;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList() ?? [];
    }
    return map;
  }

  @override
  ApiSuccessModel fromJson(Map<String, dynamic> json) =>
      TasksApiModel.fromJson(json);

  @override
  List<Object?> get props => [_page, _perPage, _total, _totalPages,];

}

/// id : 0
/// name : "string"
/// year : 0
/// color : "string"
/// pantone_value : "string"

class TaskModel {
  ///
  TaskModel({
    num? id,
    String? name,
    num? year,
    String? color,
    String? pantoneValue,
  }) {
    _id = id;
    _name = name;
    _year = year;
    _color = color;
    _pantoneValue = pantoneValue;
  }

  ///
  TaskModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'] as num?;
    _name = json['name'] as String?;
    _year = json['year'] as num?;
    _color = json['color'] as String?;
    _pantoneValue = json['pantone_value'] as String?;
  }

  num? _id;
  String? _name;
  num? _year;
  String? _color;
  String? _pantoneValue;

  ///
  TaskModel copyWith({ num? id,
    String? name,
    num? year,
    String? color,
    String? pantoneValue,
  }) =>
      TaskModel(id: id ?? _id,
        name: name ?? _name,
        year: year ?? _year,
        color: color ?? _color,
        pantoneValue: pantoneValue ?? _pantoneValue,
      );

  ///
  num get id => _id ?? 0;

  ///
  String get name => _name ?? '';

  ///
  num get year => _year ?? 0;

  ///
  String get color => _color ?? '';

  ///
  String get pantoneValue => _pantoneValue ?? '';

  ///
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['year'] = _year;
    map['color'] = _color;
    map['pantone_value'] = _pantoneValue;
    return map;
  }

}
