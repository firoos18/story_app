import 'package:equatable/equatable.dart';

class StoryDetailEntity extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? photoUrl;
  final String? createdAt;
  final double? lat;
  final double? lon;

  const StoryDetailEntity({
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

class StoryDetailesponseEntity extends Equatable {
  final bool? error;
  final String? message;
  final StoryDetailEntity? story;

  const StoryDetailesponseEntity({
    this.error,
    this.message,
    this.story,
  });

  @override
  List<Object?> get props => [
        error,
        message,
        story,
      ];
}
