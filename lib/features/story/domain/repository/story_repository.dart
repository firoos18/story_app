import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/story/domain/entities/story_entity.dart';

abstract class StoryRepository {
  Future<DataState<StoryResponseEntity>> getStoriesData({
    final int page,
    final int size,
    final int location,
  });
}
