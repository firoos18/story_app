import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:story_app_dicoding/core/resources/data_state.dart';
import 'package:story_app_dicoding/features/upload_story/domain/entity/upload_story_entity.dart';
import 'package:story_app_dicoding/features/upload_story/domain/usecase/upload_story_usecase.dart';

part 'upload_image_event.dart';
part 'upload_image_state.dart';

class UploadImageBloc extends Bloc<UploadImageEvent, UploadImageState> {
  final UploadStoryUseCase _uploadStoryUseCase;

  UploadImageBloc(this._uploadStoryUseCase) : super(UploadStoryLoading()) {
    on<OnCameraImagePicked>(onCameraImagePicked);
    on<OnGalleryImagePicked>(onGalleryImagePicked);
    on<OnUploadStory>(onUploadStory);
  }

  File? _selectedImage;

  void onCameraImagePicked(
      UploadImageEvent event, Emitter<UploadImageState> emit) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 60,
    );

    if (pickedImage == null) {
      return;
    }

    _selectedImage = File(pickedImage.path);

    emit(UploadImagePickImage(_selectedImage));
  }

  void onGalleryImagePicked(
      UploadImageEvent event, Emitter<UploadImageState> emit) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 75,
    );

    if (pickedImage == null) {
      return;
    }

    _selectedImage = File(pickedImage.path);

    emit(UploadImagePickImage(_selectedImage));
  }

  void onUploadStory(
      OnUploadStory event, Emitter<UploadImageState> emit) async {
    emit(UploadStoryLoading());
    final dataState = await _uploadStoryUseCase(
      description: event.description,
      photo: _selectedImage,
    );

    if (dataState is DataSuccess) {
      emit(UploadStorySuccess(dataState.data));
    }

    if (dataState is DataFailed) {
      emit(UploadStoryError(dataState.exception));
    }
  }
}
