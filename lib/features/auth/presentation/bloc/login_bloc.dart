import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/auth/data/models/login.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/login_entity.dart';
import 'package:story_app_dicoding/features/auth/domain/usecases/get_login_data.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBlocBloc extends Bloc<LoginEvent, LoginState> {
  final GetLoginDataUseCase _loginDataUseCase;
  final LoginDataModel loginDataModel;

  LoginBlocBloc(this._loginDataUseCase, this.loginDataModel)
      : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      final dataState = await _loginDataUseCase();

      if (dataState.data is DataSuccess) {
        emit(LoginLoaded(dataState.data!));
      }

      if (dataState.data is DataFailed) {
        emit(LoginError(dataState.exception!));
      }
    });
  }
}
