import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/core/usecases/usecases.dart';
import 'package:story_app_dicoding/features/story_detail/domain/entity/story_detail_entity.dart';
import 'package:story_app_dicoding/features/story_detail/domain/repository/story_detail_repository.dart';

class GetStoryDetailUseCase
    implements UseCase<DataState<StoryDetailesponseEntity>, String?> {
  final StoryDetailRepository _storyDetailRepository;

  GetStoryDetailUseCase(this._storyDetailRepository);

  @override
  Future<DataState<StoryDetailesponseEntity>> call({String? params}) {
    return _storyDetailRepository.getStoryDetails(storyId: params!);
  }
}
