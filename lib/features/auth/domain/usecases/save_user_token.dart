import 'package:story_app_dicoding/core/usecases/usecases.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/login_entity.dart';
import 'package:story_app_dicoding/features/auth/domain/repository/login_repository.dart';

class SaveUserTokenUseCase implements UseCase<void, LoginEntity?> {
  final LoginRepository _loginRepository;
  SaveUserTokenUseCase(this._loginRepository);

  @override
  Future<void> call({LoginEntity? params}) {
    return _loginRepository.saveToken(params!);
  }
}
