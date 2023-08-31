import 'dart:ffi';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/core/usecases/usecases.dart';
import 'package:story_app_dicoding/features/upload_story/domain/entity/upload_story_entity.dart';
import 'package:story_app_dicoding/features/upload_story/domain/repository/upload_story_repository.dart';

class UploadStoryUseCase
    implements UseCase<DataState<UploadStoryResponse>, void> {
  final UploadStoryRepository _uploadStoryRepository;

  UploadStoryUseCase(this._uploadStoryRepository);

  @override
  Future<DataState<UploadStoryResponse>> call({
    void params,
    String? description,
    File? photo,
  }) {
    return _uploadStoryRepository.uploadStory(
      description: description!,
      photo: photo!,
    );
  }
}
