part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  final LoginEntity? loginEntity;
  final RegisterEntity? registerEntity;
  final String? error;
  final bool? hasToken;
  final String? token;

  const AuthState(
      {this.loginEntity,
      this.registerEntity,
      this.hasToken,
      this.token,
      this.error});

  @override
  List<Object?> get props =>
      [registerEntity, loginEntity, hasToken, token, error];
}

final class AuthInitial extends AuthState {}

final class IsAuthenticated extends AuthState {
  const IsAuthenticated(final bool? hasToken) : super(hasToken: hasToken);
}

final class Authenticated extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthToken extends AuthState {
  const AuthToken(final String? token) : super(token: token);
}

final class AuthLoggedIn extends AuthState {
  const AuthLoggedIn(final LoginEntity loginEntity)
      : super(loginEntity: loginEntity);
}

final class AuthRegistered extends AuthState {
  const AuthRegistered(final RegisterEntity registerEntity)
      : super(registerEntity: registerEntity);
}

final class AuthError extends AuthState {
  const AuthError(final String error) : super(error: error);
}
