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
      lon: map['lon'] ?? "",
      lat: map['lat'] ?? "",
    );
  }
}
