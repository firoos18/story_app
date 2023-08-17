part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  final LoginEntity? loginEntity;
  final RegisterEntity? registerEntity;
  final DioException? dioException;

  const AuthState({this.dioException, this.loginEntity, this.registerEntity});

  @override
  List<Object?> get props => [dioException];
}

final class AuthInitial extends AuthState {}

final class IsAuthenticated extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoggedIn extends AuthState {
  const AuthLoggedIn(final LoginEntity loginEntity)
      : super(loginEntity: loginEntity);
}

final class AuthRegistered extends AuthState {
  const AuthRegistered(final RegisterEntity registerEntity)
      : super(registerEntity: registerEntity);
}

final class AuthError extends AuthState {
  const AuthError(final DioException error) : super(dioException: error);
}
