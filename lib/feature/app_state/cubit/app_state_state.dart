part of 'app_state_cubit.dart';

/// app current state
/// [authenticated] property to indicate wither user is logged in or not
class AppStateState extends Equatable {
  const AppStateState({
    required this.authenticated,
  });

  const AppStateState.init() : authenticated = false;

  final bool authenticated;

  AppStateState copyWith({bool? authenticated}) {
    return AppStateState(
      authenticated: authenticated ?? this.authenticated,
    );
  }

  @override
  List<Object> get props => [
        authenticated,
      ];
}
