import 'dart:io';

import 'package:dio/dio.dart';
import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/auth/data/data_sources/register_api_service.dart';
import 'package:story_app_dicoding/features/auth/data/models/register.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/register_data_entity.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/register_entity.dart';
import 'package:story_app_dicoding/features/auth/domain/repository/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterApiService _registerApiService;

  RegisterRepositoryImpl(this._registerApiService);

  @override
  Future<DataState<RegisterResponse>> registerUser(
      RegisterDataModel registerDataModel) async {
    try {
      final httpResponse = await _registerApiService.registerUser(
        registerDataModel: registerDataModel,
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
