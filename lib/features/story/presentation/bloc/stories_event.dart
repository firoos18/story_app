part of 'stories_bloc.dart';

sealed class StoriesEvent extends Equatable {
  const StoriesEvent();

  @override
  List<Object> get props => [];
}

class GetStories extends StoriesEvent {
  const GetStories();
}
