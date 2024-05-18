part of 'login_cubit.dart';

enum LogInStatusEnum { init, loading, error, success }

class LoginState extends Equatable {
  const LoginState({
    required this.status,
    this.errorMessage,
    this.data,
  });

  factory LoginState.init() => const LoginState(
        status: LogInStatusEnum.init,
      );

  /// request is loading
  bool get loading => status == LogInStatusEnum.loading;

  final LogInStatusEnum status;

  final String? errorMessage;

  final LogInModel? data;

  @override
  List<Object> get props => [
        status,
        errorMessage ?? '',
        data ?? '',
      ];

  LoginState copyWith({
    LogInStatusEnum? status,
    String? errorMessage,
    LogInModel? data,
  }) {
    return LoginState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? '',
    );
  }
}
