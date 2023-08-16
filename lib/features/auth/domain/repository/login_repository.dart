import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/auth/data/models/login.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/login_entity.dart';

abstract class LoginRepository {
  final LoginDataModel _loginDataModel;

  LoginRepository(this._loginDataModel);

  Future<DataState<LoginEntity>> getLoginData(
    final LoginDataModel loginDataModel,
  );
}
