import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:story_app_dicoding/core/bloc/bloc_with_state.dart';
import 'package:equatable/equatable.dart';
import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/story/domain/entities/story_entity.dart';
import 'package:story_app_dicoding/features/story/domain/usecases/get_stories.dart';

part 'stories_event.dart';
part 'stories_state.dart';

class StoriesBloc extends BlocWithState<StoriesEvent, StoriesState> {
  final GetStoriesUseCase _getStoriesUseCase;

  StoriesBloc(this._getStoriesUseCase) : super(const StoriesLoading()) {
    on<GetStories>(onGetStories);
  }
  final List<StoryEntity> _stories = [];
  int _page = 1;
  final int _pageSize = 15;

  void onGetStories(StoriesEvent event, Emitter<StoriesState> emit) async {
    final dataState =
        await _getStoriesUseCase(page: _page, size: _pageSize, location: 0);

    if (dataState is DataSuccess && dataState.data!.listStory!.isNotEmpty) {
      final stories = dataState.data!.listStory;
      final noMoreData = stories!.length < _pageSize;
      _stories.addAll(stories);
      _page++;

      emit(StoriesLoaded(_stories, noMoreData));
    }

    if (dataState is DataFailed) {
      emit(StoriesError(dataState.exception!));
    }
  }
}
