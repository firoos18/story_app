import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:story_app_dicoding/core/constants/constants.dart';
import 'package:story_app_dicoding/features/story_detail/data/models/stoy_detail_models.dart';

part 'story_detail_api_service.g.dart';

@RestApi(baseUrl: storyApiBaseUrl)
abstract class StoryDetailApiService {
  factory StoryDetailApiService(Dio dio, {String? baseUrl}) =
      _StoryDetailApiService;

  @GET('/stories/{id}')
  Future<HttpResponse<StoryDetailResponseModel>> getStoryDetail({
    @Path('id') required String id,
    @Header('Authorization') required String token,
  });
}
