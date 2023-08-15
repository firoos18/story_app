part of 'login_bloc_bloc.dart';

sealed class LoginBlocState extends Equatable {
  final LoginModel? loginData;
  final DioException? error;

  const LoginBlocState({this.error, this.loginData});

  @override
  List<Object> get props => [loginData!, error!];
}

class LoginBlocInitial extends LoginBlocState {}

class LoginBlocLoading extends LoginBlocState {
  const LoginBlocLoading();
}

class LoginBlocLoaded extends LoginBlocState {
  const LoginBlocLoaded(LoginModel loginData) : super(loginData: loginData);
}

class LoginBlocError extends LoginBlocState {
  const LoginBlocError(DioException error) : super(error: error);
}
