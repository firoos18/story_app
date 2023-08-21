import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/story_detail/domain/entity/story_detail_entity.dart';
import 'package:story_app_dicoding/features/story_detail/domain/usecase/get_story_detail_usecase.dart';

part 'story_detail_event.dart';
part 'story_detail_state.dart';

class StoryDetailBloc extends Bloc<StoryDetailEvent, StoryDetailState> {
  final GetStoryDetailUseCase _getStoryDetailUseCase;

  StoryDetailBloc(this._getStoryDetailUseCase) : super(StoryDetailLoading()) {
    on<GetStoryDetails>(onGetStoryDetails);
  }

  void onGetStoryDetails(
      GetStoryDetails event, Emitter<StoryDetailState> emit) async {
    final dataState = await _getStoryDetailUseCase(params: event.storyId);

    if (dataState is DataSuccess) {
      emit(StoryDetailLoaded(dataState.data!.story));
    }

    if (dataState is DataFailed) {
      emit(StoryDetailError(dataState.exception!));
    }
  }
}
