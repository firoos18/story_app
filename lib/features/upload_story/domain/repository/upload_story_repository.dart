import 'dart:ffi';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/upload_story/domain/entity/upload_story_entity.dart';

abstract class UploadStoryRepository {
  Future<DataState<UploadStoryResponse>> uploadStory({
    required String description,
    required File photo,
  });
}
