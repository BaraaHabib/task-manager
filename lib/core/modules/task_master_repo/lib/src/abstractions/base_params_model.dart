

import 'package:equatable/equatable.dart';

/// type of request
enum RequestType {

  /// Get request
  get,
  /// Post request
  post,
  /// Put request
  put,
  /// Delete request
  delete;
}

/// {@template params_model}
/// Base parameters mode, create a class that extend this class
/// override all required props tp pass it to api call
/// {@endtemplate}
abstract class ParamsModel<BodyModelType extends BaseBodyModel>
    extends Equatable {


  /// {@macro params_model}
  const ParamsModel({
    this.body,
    this.baseUrl,
  });

  /// api request body (post, put ...)
  final BodyModelType? body;

  /// set this to override base url
  final String? baseUrl;

  /// add additional headers to request here
  Map<String, String> get additionalHeaders;

  /// type of request
  RequestType? get requestType;

  /// [url] to api endpoint (without base url)
  /// not url is without page number or length
  /// you should fill base_url property in base provider
  String? get url;

  /// query parameters to be included in url
  Map<String, dynamic> get urlParams;

  /// does this request required authentication or not
  bool get authorized => false;
}

/// {@template params_model}
/// Base body model, create a class that extend this class
/// properties to be sent for api in the body of the request
/// {@endtemplate}
// ignore: one_member_abstracts
abstract class BaseBodyModel {

  ///
  Map<String, dynamic> toJson();
}
