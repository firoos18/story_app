import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/auth/data/models/login.dart';

abstract class LoginRepository {
  Future<DataState<LoginModel>> getLoginData();
}
