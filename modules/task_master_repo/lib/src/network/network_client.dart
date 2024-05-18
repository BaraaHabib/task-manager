// ignore_for_file: strict_raw_type, unnecessary_breaks

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:task_master_repo/src/abstractions/base_api_model.dart';
import 'package:task_master_repo/src/abstractions/base_params_model.dart';
import 'package:task_master_repo/src/resources/configuration.dart';
import 'package:task_master_repo/src/resources/exceptions.dart';
import 'package:task_master_repo/task_manager_repo.dart';
import 'package:task_master_storage/task_master_storage.dart';

part 'base_headers.dart';

/// {@template network_client}
/// Instance of this class can be used to make network calls
/// {@endtemplate}
final class NetworkClient {

  /// {@macro network_client}
  NetworkClient({
    required Dio dio,
    required String baseUrl,
  })
      : _dio = dio,
        _baseUrl = baseUrl {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = const Duration(minutes: 1);
    _dio.options.sendTimeout = const Duration(minutes: 1);
    _dio.options.receiveTimeout = const Duration(minutes: 1);


    /// add authorization interceptor
    final data = storage?.getUserData;
    final logInModel = LogInModel.fromJson(data ?? {});
    _dio.interceptors.add(BasicAuthInterceptor(token: logInModel.token,));
    ///

    _dio.interceptors.add(
        RetryInterceptor(
          dio: _dio,
          retries: 0,
        ),
    );
    if (logging) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
      );
    }
  }

  /// headers to be included in request
  Map<String, String> headers = {}..addAll(baseHeaders);

  final Dio _dio;
  final String _baseUrl;

  /// Get:----------------------------------------------------------------------
  Future<Response<T>> get<T>(String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  /// Post:---------------------------------------------------------------------
  Future<Response<T>> post<T>(String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  /// Put:----------------------------------------------------------------------
  Future<Response<T>> put<T>(String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await _dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  /// Delete:-------------------------------------------------------------------
  Future<Response<T>> delete<T>(String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return response;
  }

  /// Patch:--------------------------------------------------------------------
  Future<Response<T>> patch<T>(String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await _dio.patch<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  /// Download:-----------------------------------------------------------------
  Future<Response<dynamic>> download<T>(String urlPath,
      dynamic savePath, {
        void Function(int, int)? onReceiveProgress,
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
        bool deleteOnError = true,
        String lengthHeader = Headers.contentLengthHeader,
        dynamic data,
        Options? options,
      }) async {
    final response = await _dio.download(
      urlPath,
      savePath,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      deleteOnError: deleteOnError,
      lengthHeader: lengthHeader,
      data: data,
      options: options,
    );

    return response;
  }


  ///
  Future<ApiResponseModel<T>> performRequest<T extends ApiSuccessModel>(
      ParamsModel model,
      {
        required T Function(Map<String, dynamic>) parser,
      }) async {
    Response response;
    try {
      var url = model.baseUrl ?? _baseUrl;
      url = url + model.url.toString();
      final allHeaders = headers..addAll(model.additionalHeaders);
      final queryParameters = model.urlParams;
      final body = model.body?.toJson();
      final options = Options(
        headers: allHeaders,
      );
      switch (model.requestType!) {
        case RequestType.get:
          response =
          await get(url, queryParameters: queryParameters, options: options);
          break;
        case RequestType.post:
          response =
          await post(url, data: body,
              queryParameters: queryParameters,
              options: options,);
          break;
        case RequestType.delete:
          response =
          await delete(url, queryParameters: queryParameters, options: options);
          break;
        case RequestType.put:
          response =
          await put(url, queryParameters: queryParameters, options: options);
          break;
      }
      final data = parser.call(_returnResponse(response));
      return ApiResponseModel.success(data);
    } on DioException catch (e) {
      if (e.type is DioException && e.type is SocketException) {}

      return ApiResponseModel.error(
        // ignore: avoid_dynamic_calls
        message: e.response?.data['error'] as String? ?? e.message,);
    } on Exception catch (e) {
      return ApiResponseModel.error(message: e.toString(),);
    } finally {}
  }

  Map<String, dynamic> _returnResponse(Response response) {
    final responseJson =
    response
        .toString()
        .isEmpty ? null : json.decode(response.toString());

    switch (response.statusCode ?? 0) {
      case >= 200 && < 300:
        return responseJson as Map<String, dynamic>;
      case 401:
        throw UnauthorisedException();
      case 403:
        throw ForbiddenException();
      case >= 400 && < 500:
        throw BadRequestException();
      case 404:
        throw NotFoundException();
      case >= 500:
        throw ServerErrorException();
      default:
        throw FetchDataException();
    }
  }
}
