import 'package:flutter/material.dart';
import 'package:story_app_dicoding/features/navbar/data_sources/data/navigation_item_data.dart';
import 'package:story_app_dicoding/features/navbar/presentation/widgets/custom_bottom_navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          color: const Color(0xffFFFBFF),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff201A1B).withOpacity(0.25),
              blurRadius: 7,
              spreadRadius: 5,
              offset: const Offset(0, -3),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (final screen in navigationItemData)
            CustomNavigationBarItem(navigationItem: screen)
        ],
      ),
    );
  }
}
