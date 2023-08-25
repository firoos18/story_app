import 'package:flutter/widgets.dart';

class NavigationItemEntity {
  final String title;
  final IconData icon;
  final Widget screen;

  NavigationItemEntity({
    required this.icon,
    required this.screen,
    required this.title,
  });
}
