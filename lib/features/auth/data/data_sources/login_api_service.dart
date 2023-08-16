import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:story_app_dicoding/core/constants/constants.dart';
import 'package:story_app_dicoding/features/auth/data/models/login.dart';

part 'login_api_service.g.dart';

@RestApi(baseUrl: storyApiBaseUrl)
abstract class LoginApiService {
  factory LoginApiService(Dio dio) = _LoginApiService;

  @POST('/login')
  Future<HttpResponse<LoginResponse>> getLoginData({
    @Header('Content-Type') String contentType = 'application/json',
    // @Header('email') required String email,
    // @Header('password') required String password,
    @Body() required LoginDataModel loginDataModel,
  });
}
