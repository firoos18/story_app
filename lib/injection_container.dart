import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:story_app_dicoding/features/story/data/data_sources/remote/story_api_service.dart';
import 'package:story_app_dicoding/features/story/data/repository/story_repository_impl.dart';
import 'package:story_app_dicoding/features/story/domain/repository/story_repository.dart';
import 'package:story_app_dicoding/features/story/domain/usecases/get_stories.dart';
import 'package:story_app_dicoding/features/story/presentation/bloc/stories_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<StoryApiService>(StoryApiService(sl()));

  sl.registerSingleton<StoryRepository>(
    StoryRepositoryImpl(sl()),
  );

  // Use Cases
  sl.registerSingleton<GetStoriesUseCase>(
    GetStoriesUseCase(sl()),
  );

  // Blocs
  sl.registerFactory<StoriesBloc>(
    () => StoriesBloc(sl()),
  );
}
