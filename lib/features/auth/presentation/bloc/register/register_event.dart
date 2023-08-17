part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class EmailEvent extends RegisterEvent {
  final String email;

  const EmailEvent(this.email);
}

class PasswordEvent extends RegisterEvent {
  final String password;

  const PasswordEvent(this.password);
}

class UsernameEvent extends RegisterEvent {
  final String username;

  const UsernameEvent(this.username);
}

class OnRegisterButtonPressed extends RegisterEvent {
  final String email;
  final String password;
  final String username;

  const OnRegisterButtonPressed(this.email, this.password, this.username);
}

class OnRegisterLoading extends RegisterEvent {}

class OnRegisterError extends RegisterEvent {}
