import 'package:story_app_dicoding/core/usecases/usecases.dart';
import 'package:story_app_dicoding/features/auth/domain/repository/login_repository.dart';

class DeleteTokenUseCase implements UseCase<void, void> {
  final LoginRepository _loginRepository;

  DeleteTokenUseCase(this._loginRepository);

  @override
  Future<void> call({void params}) {
    return _loginRepository.deleteToken();
  }
}
