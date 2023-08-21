import 'package:story_app_dicoding/features/story_detail/domain/entity/story_detail_entity.dart';

class StoryDetailModel extends StoryDetailEntity {
  const StoryDetailModel({
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

  factory StoryDetailModel.fromJson(Map<String, dynamic> map) {
    return StoryDetailModel(
      id: (map['id'] ?? "") as String,
      name: (map['name'] ?? "") as String,
      description: (map['description'] ?? "") as String,
      createdAt: (map['createdAt'] ?? "") as String,
      photoUrl: (map['photoUrl'] ?? "") as String,
      lon: map['lon'],
      lat: map['lat'],
    );
  }
}

class StoryDetailResponseModel extends StoryDetailesponseEntity {
  const StoryDetailResponseModel({
    bool? error,
    String? message,
    StoryDetailModel? story,
  }) : super(
          error: error,
          message: message,
          story: story,
        );

  factory StoryDetailResponseModel.fromJson(Map<String, dynamic> json) {
    return StoryDetailResponseModel(
      error: (json['error'] as bool),
      message: (json['message'] as String),
      story: StoryDetailModel.fromJson(json['story']),
    );
  }
}
