import 'dart:io';

import 'package:dio/dio.dart';
import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/story/data/data_sources/remote/story_api_service.dart';
import 'package:story_app_dicoding/features/story/data/models/story.dart';
import 'package:story_app_dicoding/features/story/domain/repository/story_repository.dart';

class StoryRepositoryImpl implements StoryRepository {
  final StoryApiService _storyApiService;
  StoryRepositoryImpl(this._storyApiService);

  @override
  Future<DataState<List<StoryModel>>> getStoriesData() async {
    try {
      final httpResponse = await _storyApiService.getStoriesData(
        token:
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJ1c2VyLWpOT2xWNDh3enpCcWVzRzAiLCJpYXQiOjE2OTIxMTM1NzZ9.7iPlToaMDkWi9MZL_MABqZmwFFU4CABFZq8-N9Bd02Y",
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
