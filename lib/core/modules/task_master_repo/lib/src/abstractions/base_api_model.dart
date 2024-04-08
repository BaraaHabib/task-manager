
import 'package:equatable/equatable.dart';
import 'package:task_master_repo/src/resources/exceptions.dart';


/// {@template api_response_model}
/// Base api model interface
/// {@endtemplate}
class ApiResponseModel<T extends ApiSuccessModel> {

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
abstract class ApiSuccessModel extends Equatable {

  /// {@macro api_model}
  const ApiSuccessModel({this.success = false, this.message,});

  ///
  factory ApiSuccessModel.error(
      {required String message, int? code,}) = ApiErrorModel;


  ///
  final bool success;

  ///
  final String? message;

  ///
  ApiSuccessModel fromJson(Map<String, dynamic> json);

}

///
class ApiErrorModel extends ApiSuccessModel {

  ///
  factory ApiErrorModel({required String message, int? code}){
    return ApiErrorModel._(
      message: message,
      code: code,
    );
  }

  ///
  // ignore: unused_element
  const ApiErrorModel._({required String message, this.code})
      : super(message: message, success: false,);

  /// api error code from api
  final int? code;

  @override
  ApiSuccessModel fromJson(Map<String, dynamic> json) {
    throw const AppException('Error using ErrorApiModel, use [ApiModel.error]');
  }

  @override
  List<Object?> get props => [];
}
