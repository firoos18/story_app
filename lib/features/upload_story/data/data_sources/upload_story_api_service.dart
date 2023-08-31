import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:story_app_dicoding/core/constants/constants.dart';
import 'package:story_app_dicoding/features/upload_story/data/models/upload_story_models.dart';

part 'upload_story_api_service.g.dart';

@RestApi(baseUrl: storyApiBaseUrl)
abstract class UploadStoryApiService {
  factory UploadStoryApiService(Dio dio, {String? baseUrl}) =
      _UploadStoryApiService;

  // @POST('/stories')
  // @MultiPart()
  // Future<HttpResponse<UploadStoryResponseModel>> uploadStory({
  //   @Header('Authorization') required String token,
  //   @Part(name: 'description') required String description,
  //   @Part(name: 'photo') required MultipartFile photo,
  //   @Part(name: 'lat') double? lat,
  //   @Part(name: 'lon') double? lon,
  // });

  @POST('/stories')
  @MultiPart()
  Future<HttpResponse<UploadStoryResponseModel>> uploadStory({
    @Header('Authorization') required String token,
    @Part(name: 'photo') required File photo,
    @Part(name: 'description') required String description,
  });
}
