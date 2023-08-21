part of 'story_detail_bloc.dart';

sealed class StoryDetailEvent extends Equatable {
  const StoryDetailEvent();

  @override
  List<Object> get props => [];
}

class GetStoryDetails extends StoryDetailEvent {
  final String storyId;

  const GetStoryDetails({required this.storyId});
}
