import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:story_app_dicoding/core/constants/constants.dart';
import 'package:story_app_dicoding/features/story/data/models/story.dart';

part 'story_api_service.g.dart';

@RestApi(baseUrl: storyApiBaseUrl)
abstract class StoryApiService {
  factory StoryApiService(Dio dio) = _StoryApiService;

  @GET('/stories')
  Future<HttpResponse<List<StoryModel>>> getStoriesData({
    @Header('Authorization') required String token,
    @Query('page') int? page,
    @Query('size') int? size,
    @Query('location') int? location,
  });
}
