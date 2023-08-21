import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/story_detail/domain/entity/story_detail_entity.dart';

abstract class StoryDetailRepository {
  Future<DataState<StoryDetailesponseEntity>> getStoryDetails({
    required String storyId,
  });
}
