import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/story_detail/data/data_sources/remote/story_detail_api_service.dart';
import 'package:story_app_dicoding/features/story_detail/data/models/stoy_detail_models.dart';
import 'package:story_app_dicoding/features/story_detail/domain/repository/story_detail_repository.dart';

class StoryDetailRepositoryImpl implements StoryDetailRepository {
  final StoryDetailApiService _storyDetailApiService;

  StoryDetailRepositoryImpl(this._storyDetailApiService);

  @override
  Future<DataState<StoryDetailResponseModel>> getStoryDetails(
      {required String storyId}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      final httpResponse = await _storyDetailApiService.getStoryDetail(
          token: 'Bearer ${token!}', id: storyId);

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
