import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/auth/data/models/login.dart';
import 'package:story_app_dicoding/features/auth/data/models/register.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/login_entity.dart';
import 'package:story_app_dicoding/features/auth/domain/entities/register_entity.dart';
import 'package:story_app_dicoding/features/auth/domain/usecases/get_login_data.dart';
import 'package:story_app_dicoding/features/auth/domain/usecases/register_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetLoginDataUseCase _getLoginDataUseCase;
  final RegisterUserUseCase _registerUserUseCase;

  AuthBloc(this._getLoginDataUseCase, this._registerUserUseCase)
      : super(AuthInitial()) {
    on<OnRegisterEvent>(
      (event, emit) async {},
    );
    on<OnLoginEvent>(onLoginEvent);
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
      emit(AuthError(dataState.exception!));
    }
  }

  void onLoginEvent(OnLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final dataState = await _getLoginDataUseCase(
        params: LoginDataModel(
      email: event.email,
      password: event.password,
    ));

    if (dataState is DataSuccess && dataState.data != null) {
      emit(AuthLoggedIn(dataState.data!));
      prefs.setString('token', dataState.data!.loginResult!.token!);
      emit(IsAuthenticated());
    }

    if (dataState is DataFailed) {
      emit(AuthError(dataState.exception!));
    }
  }

  void onAppOpened(OnAppOpened event, Emitter<AuthState> emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      emit(IsAuthenticated());
    }

    if (token == null) {
      emit(AuthInitial());
    }
  }
}
