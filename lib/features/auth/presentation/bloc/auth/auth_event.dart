part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class OnLoginEvent extends AuthEvent {
  final String email;
  final String password;

  const OnLoginEvent({
    required this.email,
    required this.password,
  });
}

class OnRegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String username;

  const OnRegisterEvent({
    required this.email,
    required this.password,
    required this.username,
  });
}

class OnAppOpened extends AuthEvent {
  final String? token;

  const OnAppOpened({this.token});
}
