
import 'package:equatable/equatable.dart';
import 'package:task_master_repo/src/resources/exceptions.dart';


/// {@template api_response_model}
/// Base api model interface
/// {@endtemplate}
class ApiResponseModel<T extends ApiModel> {

  /// {@macro api_response_model}
  ApiResponseModel(
      {required this.success, this.data, this.message, this.code,});

  /// success model
  factory ApiResponseModel.success(T data){
    return ApiResponseModel(
      success: true,
      data: data,
    );
  }

  /// error model
  factory ApiResponseModel.error({int? code, String? message}){
    return ApiResponseModel(
      success: false,
      message: message,
      code: code,
    );
  }

  ///
  final T? data;

  ///
  final bool success;

  ///
  final String? message;

  ///
  int? code;

}


/// {@template api_model}
/// Base api model interface
/// {@endtemplate}
abstract class ApiModel extends Equatable {

  /// {@macro api_model}
  const ApiModel();


  ///
  ApiModel fromJson(Map<String, dynamic> json);

}

///
class ApiErrorModel extends ApiModel {

  @override
  ApiModel fromJson(Map<String, dynamic> json) {
    throw const AppException('Error using ErrorApiModel, use [ApiModel.error]');
  }

  @override
  List<Object?> get props => [];
}
