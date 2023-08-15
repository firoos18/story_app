import 'package:story_app_dicoding/features/auth/domain/entities/login_entity.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/login_results.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    String? error,
    String? message,
    LoginResults? loginResults,
  });

  factory LoginModel.fromJson(Map<String, dynamic> map) {
    return LoginModel(
      error: map['error'],
      message: map['message'],
      loginResults: map['loginResult'],
    );
  }
}
