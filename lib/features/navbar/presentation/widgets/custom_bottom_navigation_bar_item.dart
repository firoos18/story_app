import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app_dicoding/features/navbar/domain/entity/navigation_item_entity.dart';
import 'package:story_app_dicoding/features/navbar/presentation/bloc/navigation_bloc.dart';
import 'package:story_app_dicoding/features/story/presentation/screens/story_screen.dart';

class CustomNavigationBarItem extends StatelessWidget {
  const CustomNavigationBarItem({super.key, required this.navigationItem});

  final NavigationItemEntity navigationItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: InkWell(
            onTap: () {
              context.read<NavigationBloc>().add(
                  OnNavbarClicked(navigationItem.screen, navigationItem.title));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  navigationItem.icon,
                  color: state.activeScreen == navigationItem.screen
                      ? const Color(0xff400014)
                      : const Color(0xff400014).withOpacity(0.5),
                ),
                if (state.activeScreen == navigationItem.screen)
                  const SizedBox(height: 4),
                if (state.activeScreen == navigationItem.screen)
                  Text(
                    navigationItem.title,
                    style: const TextStyle(
                      color: Color(0xff400014),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
