import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/core/usecases/usecases.dart';
import 'package:story_app_dicoding/features/auth/data/models/register.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/register_entity.dart';
import 'package:story_app_dicoding/features/auth/domain/repository/register_repository.dart';

class RegisterUserUseCase
    implements UseCase<DataState<RegisterEntity>, RegisterDataModel?> {
  final RegisterRepository _registerRepository;
  final RegisterDataModel _registerDataModel;

  RegisterUserUseCase(this._registerDataModel, this._registerRepository);

  @override
  Future<DataState<RegisterEntity>> call({RegisterDataModel? params}) {
    return _registerRepository.registerUser(params!);
  }
}
