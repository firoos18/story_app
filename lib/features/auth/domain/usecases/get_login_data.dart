import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/core/usecases/usecases.dart';
import 'package:story_app_dicoding/features/auth/data/models/login.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/login_data_entity.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/login_entity.dart';
import 'package:story_app_dicoding/features/auth/domain/repository/login_repository.dart';

class GetLoginDataUseCase
    implements UseCase<DataState<LoginEntity>, LoginDataModel?> {
  final LoginRepository _loginRepository;
  final LoginDataModel _loginDataModel;

  GetLoginDataUseCase(this._loginRepository, this._loginDataModel);

  @override
  Future<DataState<LoginEntity>> call({params}) {
    return _loginRepository.getLoginData(_loginDataModel);
  }
}
