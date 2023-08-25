import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app_dicoding/features/navbar/presentation/bloc/navigation_bloc.dart';
import 'package:story_app_dicoding/features/navbar/presentation/widgets/custom_bottom_navigation.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
        builder: (contxt, state) {
      return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: Text(
            state.title!,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: state.activeScreen,
        bottomNavigationBar: const CustomBottomNavigationBar(),
      );
    });
  }
}
