part of 'stories_bloc.dart';

sealed class StoriesState extends Equatable {
  // final StoryResponseEntity? stories;
  final List<StoryEntity>? stories;
  final bool? noMoreData;
  final DioException? error;

  const StoriesState({this.error, this.stories, this.noMoreData});

  @override
  List<Object?> get props => [stories, error, noMoreData];
}

class StoriesLoading extends StoriesState {
  const StoriesLoading();
}

class StoriesLoaded extends StoriesState {
  const StoriesLoaded(List<StoryEntity> stories, bool? noMoreData)
      : super(stories: stories, noMoreData: noMoreData);
}

class StoriesError extends StoriesState {
  const StoriesError(DioException error) : super(error: error);
}
