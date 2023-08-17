part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  String? username;
  String? password;
  String? email;

  RegisterState({this.username, this.email, this.password});

  @override
  List<Object> get props => [username!, email!, password!];
}

class RegisterInitial extends RegisterState {
  RegisterInitial(
      final String? email, final String? password, final String? username)
      : super(email: email, password: password, username: username);
}

class RegisterLoading extends RegisterState {}

class RegisterFailed extends RegisterState {}
