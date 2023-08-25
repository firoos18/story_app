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
import 'package:story_app_dicoding/features/auth/domain/usecases/delete_token_usecase.dart';
import 'package:story_app_dicoding/features/auth/domain/usecases/get_login_data.dart';
import 'package:story_app_dicoding/features/auth/domain/usecases/has_token_usecase.dart';
import 'package:story_app_dicoding/features/auth/domain/usecases/register_user.dart';
import 'package:story_app_dicoding/features/auth/domain/usecases/save_user_token.dart';
import 'package:story_app_dicoding/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:story_app_dicoding/features/navbar/presentation/bloc/navigation_bloc.dart';
import 'package:story_app_dicoding/features/story/data/data_sources/remote/story_api_service.dart';
import 'package:story_app_dicoding/features/story/data/repository/story_repository_impl.dart';
import 'package:story_app_dicoding/features/story/domain/repository/story_repository.dart';
import 'package:story_app_dicoding/features/story/domain/usecases/get_stories.dart';
import 'package:story_app_dicoding/features/story/presentation/bloc/stories_bloc.dart';
import 'package:story_app_dicoding/features/story_detail/data/data_sources/remote/story_detail_api_service.dart';
import 'package:story_app_dicoding/features/story_detail/data/repository/story_detail_repository_impl.dart';
import 'package:story_app_dicoding/features/story_detail/domain/repository/story_detail_repository.dart';
import 'package:story_app_dicoding/features/story_detail/domain/usecase/get_story_detail_usecase.dart';
import 'package:story_app_dicoding/features/story_detail/presentation/bloc/story_detail_bloc.dart';

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
  sl.registerSingleton<StoryDetailApiService>(StoryDetailApiService(sl()));

  sl.registerSingleton<StoryRepository>(
    StoryRepositoryImpl(sl()),
  );
  sl.registerSingleton<RegisterRepository>(
    RegisterRepositoryImpl(sl()),
  );
  sl.registerSingleton<LoginRepository>(
    LoginRepositoryImpl(sl()),
  );
  sl.registerSingleton<StoryDetailRepository>(
    StoryDetailRepositoryImpl(sl()),
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
  sl.registerSingleton<SaveUserTokenUseCase>(
    SaveUserTokenUseCase(sl()),
  );
  sl.registerSingleton<HasTokenUseCase>(
    HasTokenUseCase(sl()),
  );
  sl.registerSingleton<DeleteTokenUseCase>(
    DeleteTokenUseCase(sl()),
  );
  sl.registerSingleton<GetStoryDetailUseCase>(
    GetStoryDetailUseCase(sl()),
  );

  // Blocs
  sl.registerFactory<StoriesBloc>(
    () => StoriesBloc(sl()),
  );
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(sl(), sl(), sl(), sl()),
  );
  sl.registerFactory<StoryDetailBloc>(
    () => StoryDetailBloc(sl()),
  );
  sl.registerFactory<NavigationBloc>(
    () => NavigationBloc(),
  );
}
