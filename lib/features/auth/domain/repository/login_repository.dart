import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/auth/data/models/login.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/login_entity.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/login_results.dart';

abstract class LoginRepository {
  LoginRepository();

  Future<DataState<LoginEntity>> getLoginData(
    final LoginDataModel? loginDataModel,
  );

  Future<void> saveToken(
    final LoginEntity loginEntity,
  );

  Future<bool> hasToken();

  Future<void> deleteToken();
}
