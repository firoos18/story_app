part of 'stories_bloc.dart';

sealed class StoriesState extends Equatable {
  final List<StoryEntity>? stories;
  final DioException? error;

  const StoriesState({this.error, this.stories});

  @override
  List<Object> get props => [stories!, error!];
}

class StoriesLoading extends StoriesState {
  const StoriesLoading();
}

class StoriesLoaded extends StoriesState {
  const StoriesLoaded(List<StoryEntity> stories) : super(stories: stories);
}

class StoriesError extends StoriesState {
  const StoriesError(DioException error) : super(error: error);
}
