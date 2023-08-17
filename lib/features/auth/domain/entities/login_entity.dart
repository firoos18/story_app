import 'package:equatable/equatable.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/login_results.dart';

class LoginEntity extends Equatable {
  final bool? error;
  final String? message;
  final LoginResults? loginResult;

  const LoginEntity({
    this.error,
    this.message,
    this.loginResult,
  });

  @override
  List<Object?> get props {
    return [
      error,
      message,
      loginResult,
    ];
  }
}
