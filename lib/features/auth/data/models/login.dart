import 'package:flutter/rendering.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/login_entity.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/login_results.dart';

class LoginResponse extends LoginEntity {
  const LoginResponse({
    String? error,
    String? message,
    LoginResults? loginResults,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> map) {
    return LoginResponse(
      error: map['error'],
      message: map['message'],
      loginResults: map['loginResult'],
    );
  }
}

class LoginDataModel {
  const LoginDataModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
