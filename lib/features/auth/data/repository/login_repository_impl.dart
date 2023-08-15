import 'dart:io';

import 'package:dio/dio.dart';
import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/auth/data/data_sources/login_api_service.dart';
import 'package:story_app_dicoding/features/auth/data/models/login.dart';

import 'package:story_app_dicoding/features/auth/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginApiService _loginApiService;

  LoginRepositoryImpl(this._loginApiService);

  @override
  Future<DataState<LoginModel>> getLoginData() async {
    try {
      final httpResponse = await _loginApiService.getLoginData(
        email: 'njhaerin@gmail.com',
        password: 'haerinsupacute',
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
