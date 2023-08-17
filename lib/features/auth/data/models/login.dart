import 'package:story_app_dicoding/features/auth/domain/entities/login_entity.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/login_results.dart';

class LoginResponse extends LoginEntity {
  const LoginResponse({
    bool? error,
    String? message,
    LoginResultsResponse? loginResults,
  }) : super(error: error, message: message, loginResult: loginResults);

  factory LoginResponse.fromJson(Map<String, dynamic> map) {
    return LoginResponse(
      error: (map['error'] ?? false) as bool,
      message: (map['message'] ?? '') as String,
      loginResults: LoginResultsResponse.fromJson(map['loginResult']),
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

class LoginResultsResponse extends LoginResults {
  LoginResultsResponse({
    String? userId,
    String? name,
    String? token,
  }) : super(name: name, userId: userId, token: token);

  factory LoginResultsResponse.fromJson(Map<String, dynamic> json) {
    return LoginResultsResponse(
      userId: (json['userId'] ?? '') as String,
      name: (json['name'] ?? '') as String,
      token: (json['token'] ?? '') as String,
    );
  }
}
