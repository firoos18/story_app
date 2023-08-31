import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class UploadStoryResponse extends Equatable {
  final bool? error;
  final String? message;

  const UploadStoryResponse({this.error, this.message});

  @override
  List<Object?> get props => [
        error,
        message,
      ];
}

class UploadStoryBody extends Equatable {
  final String? description;
  final MultipartFile? photo;
  final double? lat;
  final double? lon;

  const UploadStoryBody({this.description, this.photo, this.lat, this.lon});

  @override
  List<Object?> get props => [
        description,
        photo,
        lat,
        lon,
      ];
}
