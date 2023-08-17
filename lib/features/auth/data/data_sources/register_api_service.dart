import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:story_app_dicoding/core/constants/constants.dart';
import 'package:story_app_dicoding/features/auth/data/models/register.dart';

part 'register_api_service.g.dart';

@RestApi(baseUrl: storyApiBaseUrl)
abstract class RegisterApiService {
  factory RegisterApiService(Dio dio) = _RegisterApiService;

  @POST('/register')
  Future<HttpResponse<RegisterResponse>> registerUser({
    @Header('Content-Type') String contentType = 'application/json',
    @Body() required RegisterDataModel registerDataModel,
  });
}
