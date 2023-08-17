import 'package:story_app_dicoding/features/auth/domain/entities/register_entity.dart';

class RegisterResponse extends RegisterEntity {
  const RegisterResponse({
    bool? error,
    String? message,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      error: json['error'],
      message: json['message'],
    );
  }
}

class RegisterDataModel {
  final String username;
  final String email;
  final String password;

  RegisterDataModel({
    required this.email,
    required this.password,
    required this.username,
  });

  Map<String, dynamic> toJson() => {
        'name': username,
        'email': email,
        'password': password,
      };
}
