import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/auth/data/models/login.dart';
import 'package:story_app_dicoding/features/auth/data/models/register.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/login_entity.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/register_entity.dart';
import 'package:story_app_dicoding/features/auth/domain/usecases/get_login_data.dart';
import 'package:story_app_dicoding/features/auth/domain/usecases/has_token_usecase.dart';
import 'package:story_app_dicoding/features/auth/domain/usecases/register_user.dart';
import 'package:story_app_dicoding/features/auth/domain/usecases/save_user_token.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetLoginDataUseCase _getLoginDataUseCase;
  final RegisterUserUseCase _registerUserUseCase;
  final SaveUserTokenUseCase _saveUserTokenUseCase;
  final HasTokenUseCase _hasTokenUseCase;

  AuthBloc(
    this._getLoginDataUseCase,
    this._registerUserUseCase,
    this._saveUserTokenUseCase,
    this._hasTokenUseCase,
  ) : super(AuthInitial()) {
    on<OnRegisterEvent>(
      (event, emit) async {},
    );
    on<OnLoginEvent>(onLoginEvent);
    on<OnAppOpened>(onAppOpened);
  }

  void onRegisterEvent(OnRegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final dataState = await _registerUserUseCase(
        params: RegisterDataModel(
            email: event.email,
            password: event.password,
            username: event.username));

    if (dataState is DataSuccess && dataState.data != null) {
      emit(AuthRegistered(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(AuthError(dataState.data!.message!));
    }
  }

  void onLoginEvent(OnLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final dataState = await _getLoginDataUseCase(
        params: LoginDataModel(
      email: event.email,
      password: event.password,
    ));

    if (dataState is DataSuccess && dataState.data!.error != true) {
      await _saveUserTokenUseCase(params: dataState.data);

      emit(AuthToken(dataState.data!.loginResult!.token));
      emit(AuthLoggedIn(dataState.data!));
      emit(Authenticated());
    }

    if (dataState is DataFailed) {
      emit(AuthError(dataState.exception!.message!));
    }
  }

  void onAppOpened(OnAppOpened event, Emitter<AuthState> emit) async {
    final hasToken = await _hasTokenUseCase();

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (hasToken) {
      emit(AuthToken(token));
      emit(Authenticated());
    } else {
      emit(AuthInitial());
    }
  }
}
