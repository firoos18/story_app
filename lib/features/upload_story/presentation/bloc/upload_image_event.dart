part of 'upload_image_bloc.dart';

sealed class UploadImageEvent extends Equatable {
  const UploadImageEvent();

  @override
  List<Object?> get props => [];
}

class OnGalleryImagePicked extends UploadImageEvent {}

class OnCameraImagePicked extends UploadImageEvent {}

class OnLocationAdded extends UploadImageEvent {}

class OnDescriptionAdded extends UploadImageEvent {
  const OnDescriptionAdded(final String? description);
}

class OnUploadStory extends UploadImageEvent {
  final String description;

  const OnUploadStory({required this.description});
}
