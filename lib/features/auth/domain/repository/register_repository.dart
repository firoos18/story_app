import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/auth/data/models/register.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/register_entity.dart';

abstract class RegisterRepository {
  // final RegisterDataEntity _registerDataEntity;

  RegisterRepository();

  Future<DataState<RegisterEntity>> registerUser(
    final RegisterDataModel registerDataModel,
  );
}
