import 'package:story_app_dicoding/core/usecases/usecases.dart';
import 'package:story_app_dicoding/features/auth/data/models/login.dart';
import 'package:story_app_dicoding/features/auth/domain/repository/login_repository.dart';

class HasTokenUseCase implements UseCase<bool, void> {
  final LoginRepository _LoginRepository;

  HasTokenUseCase(this._LoginRepository);

  @override
  Future<bool> call({void params}) {
    return _LoginRepository.hasToken();
  }
}
