import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/auth/data/models/login.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/login_data_entity.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/login_entity.dart';
import 'package:story_app_dicoding/features/auth/domain/repository/login_repository.dart';
import 'package:story_app_dicoding/features/auth/domain/usecases/get_login_data.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetLoginDataUseCase _loginDataUseCase;
  final LoginDataModel loginDataModel;
  final LoginRepository loginRepository;

  LoginBloc(this._loginDataUseCase, this.loginDataModel, this.loginRepository)
      : super(LoginInitial()) {
    // on<LoginButtonPressed>((event, emit) async {
    //   final dataState = await _loginDataUseCase();

    //   if (dataState.data is DataSuccess &&
    //       dataState.data!.loginResult != null) {
    //     emit(LoginLoaded(dataState.data!));
    //     print(dataState.data!.loginResult);
    //   }

    //   if (dataState.data is DataFailed) {
    //     emit(LoginError(dataState.exception!));
    //   }
    // });

    on<LoginButtonPressed>(onLoginButtonPressed);
  }

  void onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());
    try {
      final LoginDataModel loginDataModel =
          LoginDataModel(email: event.email, password: event.password);

      final loginData = loginRepository.getLoginData(loginDataModel);
      print(loginData);
    } catch (e) {
      print(e);
    }
  }
}
