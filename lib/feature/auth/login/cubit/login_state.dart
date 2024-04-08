part of 'login_cubit.dart';

enum LogInStatusEnum { init, loading, error, success }

class LoginState extends Equatable {
  const LoginState({
    required this.status,
    this.errorMessage,
    this.token,
  });

  factory LoginState.init() => const LoginState(
        status: LogInStatusEnum.init,
      );

  /// request is loading
  bool get loading => status == LogInStatusEnum.loading;

  final LogInStatusEnum status;

  final String? errorMessage;

  final String? token;

  @override
  List<Object> get props => [
        status,
        errorMessage ?? '',
        token ?? '',
      ];

  LoginState copyWith({
    LogInStatusEnum? status,
    String? errorMessage,
    String? token,
  }) {
    return LoginState(
      status: status ?? this.status,
      token: token ?? this.token,
      errorMessage: errorMessage ?? '',
    );
  }
}
