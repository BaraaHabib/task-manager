part of 'splash_cubit.dart';

enum SplashStateEnum {
  loading,
  authenticated,
  unauthenticated,
}

class SplashState extends Equatable {
  const SplashState(this.status);

  const SplashState.authenticated() : status = SplashStateEnum.authenticated;
  const SplashState.unauthenticated()
      : status = SplashStateEnum.unauthenticated;
  const SplashState.loading() : status = SplashStateEnum.loading;

  final SplashStateEnum status;

  @override
  List<Object> get props => [
        status,
      ];
}
