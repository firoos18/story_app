import 'package:flutter/rendering.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/login_entity.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/login_results.dart';

class LoginResponse extends LoginEntity {
  const LoginResponse({
    bool? error,
    String? message,
    LoginResultsResponse? loginResults,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> map) {
    return LoginResponse(
      error: map['error'] ?? "",
      message: map['message'] ?? "",
      loginResults: LoginResultsResponse.fromJson(map['loginResult'] ?? ""),
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

class LoginResultsResponse {
  final String userId;
  final String name;
  final String token;

  LoginResultsResponse({
    required this.userId,
    required this.name,
    required this.token,
  });

  factory LoginResultsResponse.fromJson(Map<String, dynamic> json) {
    return LoginResultsResponse(
      userId: json['userId'],
      name: json['name'],
      token: json['token'],
    );
  }
}
