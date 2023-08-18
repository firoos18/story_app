import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/story/data/data_sources/remote/story_api_service.dart';
import 'package:story_app_dicoding/features/story/data/models/story.dart';
import 'package:story_app_dicoding/features/story/domain/repository/story_repository.dart';

class StoryRepositoryImpl implements StoryRepository {
  final StoryApiService _storyApiService;
  StoryRepositoryImpl(this._storyApiService);

  @override
  Future<DataState<StoryResponseModel>> getStoriesData({
    int? page,
    int? size,
    int? location,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      final httpResponse = await _storyApiService.getStoriesData(
        token: "Bearer $token",
        page: page,
        size: size,
        location: location,
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
