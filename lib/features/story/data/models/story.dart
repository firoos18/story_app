import 'package:story_app_dicoding/features/story/domain/entities/story_entity.dart';

class StoryModel extends StoryEntity {
  const StoryModel({
    String? id,
    String? createdAt,
    String? description,
    String? name,
    String? photoUrl,
    double? lat,
    double? lon,
  }) : super(
          id: id,
          createdAt: createdAt,
          description: description,
          name: name,
          photoUrl: photoUrl,
          lat: lat,
          lon: lon,
        );

  factory StoryModel.fromJson(Map<String, dynamic> map) {
    return StoryModel(
      id: map['id'] ?? "",
      name: map['name'] ?? "",
      description: map['description'] ?? "",
      createdAt: map['createdAt'] ?? "",
      photoUrl: map['photoUrl'] ?? "",
      lon: map['lon'] ?? 0.0,
      lat: map['lat'] ?? 0.0,
    );
  }
}

class StoryResponseModel extends StoryResponseEntity {
  const StoryResponseModel({
    bool? error,
    String? message,
    List<StoryModel>? listStory,
  }) : super(
          error: error,
          message: message,
          listStory: listStory,
        );

  factory StoryResponseModel.fromJson(Map<String, dynamic> json) {
    return StoryResponseModel(
      error: json['error'],
      message: json['message'],
      listStory: List<StoryModel>.from(
        (json['listStory'] as List<dynamic>)
            .map((e) => StoryModel.fromJson(e as Map<String, dynamic>)),
      ),
    );
  }
}
