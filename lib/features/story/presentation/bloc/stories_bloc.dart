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

  int page = 2;
  int size = 20;
  bool isFetching = false;

  StoriesBloc(this._getStoriesUseCase) : super(const StoriesLoading()) {
    on<GetStories>(onGetStories);
  }

  void onGetStories(GetStories event, Emitter<StoriesState> emit) async {
    final dataState = await _getStoriesUseCase(
      page: page,
      size: size,
      location: 1,
    );

    if (dataState is DataSuccess) {
      emit(StoriesLoaded(dataState.data!));
      page += 1;
    }

    if (dataState is DataFailed) {
      print(dataState.exception);
      emit(StoriesError(dataState.exception!));
    }
  }

  // @override
  // Stream<StoriesState> mapEventToState(StoriesEvent event) async* {
  //   if (event is GetStories) yield* _getStoriesData(event);
  // }

  // Stream<StoriesState> _getStoriesData(StoriesEvent event) async* {
  //   yield* runBlocProcess(() async* {
  //     final dataState = await _getStoriesUseCase();

  //     if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
  //       yield StoriesLoaded(dataState.data!);
  //     }

  //     if (dataState is DataFailed) {
  //       yield StoriesError(dataState.exception!);
  //     }
  //   });
  // }
}
