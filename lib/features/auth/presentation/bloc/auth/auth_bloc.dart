import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/auth/data/models/login.dart';
import 'package:story_app_dicoding/features/auth/data/models/register.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/login_data_entity.dart';
import 'package:story_app_dicoding/features/auth/domain/repository/login_repository.dart';
import 'package:story_app_dicoding/features/auth/domain/repository/register_repository.dart';
import 'package:story_app_dicoding/features/auth/domain/usecases/get_login_data.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginRepository _loginRepository;
  final RegisterRepository _registerRepository;
  final GetLoginDataUseCase _getLoginDataUseCase;

  AuthBloc(this._loginRepository, this._registerRepository,
      this._getLoginDataUseCase)
      : super(AuthInitial()) {
    on<OnRegisterEvent>(onRegisterEvent);
    on<OnLoginEvent>(onLoginEvent);
  }

  void onRegisterEvent(OnRegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    // try {
    //   final registerResponse =
    //       await _registerRepository.registerUser(RegisterDataModel(
    //     email: event.email,
    //     password: event.password,
    //     username: event.username,
    //   ));
    //   print(registerResponse.data!);
    // } catch (e) {
    //   emit(const AuthError(error: 'Register Failed!'));
    // }
    final registerResponse =
        await _registerRepository.registerUser(RegisterDataModel(
      email: event.email,
      password: event.password,
      username: event.username,
    ));
  }

  void onLoginEvent(OnLoginEvent event, Emitter<AuthState> emit) async {
    // final loginData = await _loginRepository.getLoginData(LoginDataModel(
    //   email: event.email,
    //   password: event.password,
    // ));

    final dataState = await _getLoginDataUseCase(
        params: LoginDataModel(
      email: event.email,
      password: event.password,
    ));

    if (dataState is DataSuccess && dataState.data != null) {
      print(dataState.data!);
    }

    if (dataState is DataFailed) {
      print(dataState.exception!);
    }
  }
}
