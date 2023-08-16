part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  final LoginEntity? loginEntity;
  final DioException? error;

  const LoginState({this.error, this.loginEntity});

  @override
  List<Object> get props => [loginEntity!, error!];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginLoaded extends LoginState {
  const LoginLoaded(LoginEntity loginEntity) : super(loginEntity: loginEntity);
}

class LoginError extends LoginState {
  const LoginError(DioException error) : super(error: error);
}
