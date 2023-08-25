import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:story_app_dicoding/features/navbar/domain/entity/navigation_item_entity.dart';
import 'package:story_app_dicoding/features/profile/presentation/screens/profile_screen.dart';
import 'package:story_app_dicoding/features/story/presentation/screens/story_screen.dart';
import 'package:story_app_dicoding/features/upload_story/presentation/screens/upload_story_screen.dart';

List<NavigationItemEntity> navigationItemData = [
  NavigationItemEntity(
    icon: FeatherIcons.home,
    screen: const StoryScreen(),
    title: 'Home',
  ),
  NavigationItemEntity(
    icon: FeatherIcons.plusCircle,
    screen: const UploadStoryScreen(),
    title: 'Upload',
  ),
  NavigationItemEntity(
    icon: FeatherIcons.user,
    screen: const ProfileScreen(),
    title: 'Profile',
  ),
];
