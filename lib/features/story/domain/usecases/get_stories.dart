import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/core/usecases/usecases.dart';
import 'package:story_app_dicoding/features/story/domain/entities/story_entity.dart';
import 'package:story_app_dicoding/features/story/domain/repository/story_repository.dart';

class GetStoriesUseCase
    implements UseCase<DataState<StoryResponseEntity>, int?> {
  final StoryRepository _storyRepository;

  GetStoriesUseCase(this._storyRepository);

  @override
  Future<DataState<StoryResponseEntity>> call(
      {void params, int? page, int? size, int? location}) {
    return _storyRepository.getStoriesData(
      page: page!,
      size: size!,
      location: location!,
    );
  }
}
