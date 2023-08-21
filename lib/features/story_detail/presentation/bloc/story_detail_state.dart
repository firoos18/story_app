part of 'story_detail_bloc.dart';

sealed class StoryDetailState extends Equatable {
  final StoryDetailEntity? storyDetails;
  final DioException? exception;

  const StoryDetailState({this.exception, this.storyDetails});

  @override
  List<Object?> get props => [storyDetails, exception];
}

class StoryDetailLoading extends StoryDetailState {}

class StoryDetailLoaded extends StoryDetailState {
  const StoryDetailLoaded(final StoryDetailEntity? storyDetails)
      : super(storyDetails: storyDetails);
}

class StoryDetailError extends StoryDetailState {
  const StoryDetailError(DioException exception) : super(exception: exception);
}
