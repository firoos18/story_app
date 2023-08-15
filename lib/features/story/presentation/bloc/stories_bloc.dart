import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/story/domain/entities/story_entity.dart';
import 'package:story_app_dicoding/features/story/domain/usecases/get_stories.dart';

part 'stories_event.dart';
part 'stories_state.dart';

class StoriesBloc extends Bloc<StoriesEvent, StoriesState> {
  final GetStoriesUseCase _getStoriesUseCase;

  StoriesBloc(this._getStoriesUseCase) : super(const StoriesLoading()) {
    on<GetStories>(onGetStories);
  }

  void onGetStories(GetStories event, Emitter<StoriesState> emit) async {
    final dataState = await _getStoriesUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(StoriesLoaded(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(StoriesError(dataState.exception!));
    }
  }
}
