import 'dart:io';

import 'package:dio/dio.dart';
import 'package:story_app_dicoding/features/upload_story/domain/entity/upload_story_entity.dart';

class UploadStoryResponseModel extends UploadStoryResponse {
  const UploadStoryResponseModel({
    bool? error,
    String? message,
  }) : super(error: error, message: message);

  factory UploadStoryResponseModel.fromJson(Map<String, dynamic> json) {
    return UploadStoryResponseModel(
      error: json['error'],
      message: json['message'],
    );
  }
}

class UploadStoryBodyModel extends UploadStoryBody {
  const UploadStoryBodyModel({
    String? description,
    MultipartFile? photo,
    double? lat,
    double? lon,
  }) : super(description: description, photo: photo, lat: lat, lon: lon);

  Map<String, dynamic> toJson() => {
        'description': description,
        'photo': photo,
        'lat': lat,
        'lon': lon,
      };

  factory UploadStoryBodyModel.fromJson(Map<String, dynamic> json) {
    return UploadStoryBodyModel(
      description: json['description'],
      photo: json['photo'],
      lat: json['lat'],
      lon: json['lon'],
    );
  }
}
