import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/upload_story/data/data_sources/upload_story_api_service.dart';
import 'package:story_app_dicoding/features/upload_story/data/models/upload_story_models.dart';
import 'package:story_app_dicoding/features/upload_story/domain/repository/upload_story_repository.dart';

class UploadStoryRepositoryImpl implements UploadStoryRepository {
  final UploadStoryApiService _uploadStoryApiService;

  UploadStoryRepositoryImpl(this._uploadStoryApiService);

  @override
  Future<DataState<UploadStoryResponseModel>> uploadStory({
    required String description,
    required File photo,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      final httpResponse = await _uploadStoryApiService.uploadStory(
        token: 'Bearer $token',
        description: description,
        photo: photo,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok ||
          httpResponse.response.statusCode == HttpStatus.created) {
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
