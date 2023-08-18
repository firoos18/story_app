import 'package:equatable/equatable.dart';

class StoryEntity extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? photoUrl;
  final String? createdAt;
  final double? lat;
  final double? lon;

  const StoryEntity({
    this.createdAt,
    this.description,
    this.id,
    this.lat,
    this.lon,
    this.name,
    this.photoUrl,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        photoUrl,
        createdAt,
        lat,
        lon,
      ];
}

class StoryResponseEntity extends Equatable {
  final bool? error;
  final String? message;
  final List<StoryEntity>? listStory;

  const StoryResponseEntity({
    this.error,
    this.listStory,
    this.message,
  });

  @override
  List<Object?> get props => [
        error,
        message,
        listStory,
      ];
}
