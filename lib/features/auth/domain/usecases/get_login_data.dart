import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/core/usecases/usecases.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/login_entity.dart';
import 'package:story_app_dicoding/features/auth/domain/repository/login_repository.dart';

class GetLoginDataUseCase implements UseCase<DataState<LoginEntity>, void> {
  final LoginRepository _loginRepository;

  GetLoginDataUseCase(this._loginRepository);

  @override
  Future<DataState<LoginEntity>> call({params}) {
    return _loginRepository.getLoginData();
  }
}
