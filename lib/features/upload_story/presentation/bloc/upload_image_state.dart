part of 'upload_image_bloc.dart';

sealed class UploadImageState extends Equatable {
  final File? pickedImage;
  final String? description;
  final double? lat;
  final double? lng;
  final DioException? exception;
  final UploadStoryResponse? response;

  const UploadImageState(
      {this.pickedImage,
      this.lat,
      this.lng,
      this.description,
      this.exception,
      this.response});

  @override
  List<Object?> get props =>
      [pickedImage, lat, lng, description, exception, response];
}

final class UploadImageInitial extends UploadImageState {}

class UploadImagePickImage extends UploadImageState {
  const UploadImagePickImage(final File? pickedImage)
      : super(pickedImage: pickedImage);
}

class UploadImageLocationAdded extends UploadImageState {
  const UploadImageLocationAdded(final double? lat, final double? lng)
      : super(lat: lat, lng: lng);
}

class UploadImageDescriptionAdded extends UploadImageState {
  const UploadImageDescriptionAdded(final String? description)
      : super(description: description);
}

class UploadStoryLoading extends UploadImageState {}

class UploadStorySuccess extends UploadImageState {
  const UploadStorySuccess(final UploadStoryResponse? response)
      : super(response: response);
}

class UploadStoryError extends UploadImageState {
  const UploadStoryError(final DioException? exception)
      : super(exception: exception);
}
