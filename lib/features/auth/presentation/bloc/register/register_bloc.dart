import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/auth/data/models/register.dart';
import 'package:story_app_dicoding/features/auth/domain/repository/register_repository.dart';
import 'package:story_app_dicoding/features/auth/domain/usecases/register_user.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUserUseCase _registerUserUseCase;
  final RegisterDataModel _registerDataModel;
  final RegisterRepository _registerRepository;

  RegisterBloc(this._registerDataModel, this._registerRepository,
      this._registerUserUseCase)
      : super(RegisterInitial('', '', '')) {
    on<OnRegisterButtonPressed>(onRegisterButtonPressed);
  }

  void onRegisterButtonPressed(
    OnRegisterButtonPressed event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());
    emit(RegisterInitial(event.email, event.password, event.username));

    if (state.email != null ||
        state.password != null ||
        state.username != null) {
      final dataModel = RegisterDataModel(
          email: state.email!,
          password: state.password!,
          username: state.username!);

      _registerRepository.registerUser(dataModel);
    }
  }
}
