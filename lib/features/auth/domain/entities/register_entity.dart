import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final String? error;
  final String? message;

  const RegisterEntity({this.error, this.message});

  @override
  List<Object?> get props {
    return [
      error,
      message,
    ];
  }
}
