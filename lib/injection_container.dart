import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:story_app_dicoding/features/auth/data/data_sources/login_api_service.dart';
import 'package:story_app_dicoding/features/auth/data/data_sources/register_api_service.dart';
import 'package:story_app_dicoding/features/auth/data/models/login.dart';
import 'package:story_app_dicoding/features/auth/data/models/register.dart';
import 'package:story_app_dicoding/features/auth/data/repository/login_repository_impl.dart';
import 'package:story_app_dicoding/features/auth/data/repository/register_respository_impl.dart';
import 'package:story_app_dicoding/features/auth/domain/repository/login_repository.dart';
import 'package:story_app_dicoding/features/auth/domain/repository/register_repository.dart';
import 'package:story_app_dicoding/features/auth/domain/usecases/get_login_data.dart';
import 'package:story_app_dicoding/features/auth/domain/usecases/register_user.dart';
import 'package:story_app_dicoding/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:story_app_dicoding/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:story_app_dicoding/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:story_app_dicoding/features/story/data/data_sources/remote/story_api_service.dart';
import 'package:story_app_dicoding/features/story/data/repository/story_repository_impl.dart';
import 'package:story_app_dicoding/features/story/domain/repository/story_repository.dart';
import 'package:story_app_dicoding/features/story/domain/usecases/get_stories.dart';
import 'package:story_app_dicoding/features/story/presentation/bloc/stories_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Models
  sl.registerSingleton<RegisterDataModel>(
      RegisterDataModel(email: '', password: '', username: ''));
  sl.registerSingleton<LoginDataModel>(
      const LoginDataModel(email: '', password: ''));

  // Dependencies
  sl.registerSingleton<StoryApiService>(StoryApiService(sl()));
  sl.registerSingleton<RegisterApiService>(RegisterApiService(sl()));
  sl.registerSingleton<LoginApiService>(LoginApiService(sl()));

  sl.registerSingleton<StoryRepository>(
    StoryRepositoryImpl(sl()),
  );
  sl.registerSingleton<RegisterRepository>(
    RegisterRepositoryImpl(sl()),
  );
  sl.registerSingleton<LoginRepository>(
    LoginRepositoryImpl(sl()),
  );

  // Use Cases
  sl.registerSingleton<GetStoriesUseCase>(
    GetStoriesUseCase(sl()),
  );
  sl.registerSingleton<RegisterUserUseCase>(
    RegisterUserUseCase(sl(), sl()),
  );
  sl.registerSingleton<GetLoginDataUseCase>(
    GetLoginDataUseCase(sl()),
  );

  // Blocs
  sl.registerFactory<StoriesBloc>(
    () => StoriesBloc(sl()),
  );
  sl.registerFactory<RegisterBloc>(
    () => RegisterBloc(sl(), sl(), sl()),
  );
  sl.registerFactory<LoginBloc>(
    () => LoginBloc(sl(), sl(), sl()),
  );
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(sl(), sl(), sl()),
  );
}
