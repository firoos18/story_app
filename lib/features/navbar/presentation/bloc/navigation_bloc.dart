import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:story_app_dicoding/features/story/presentation/screens/story_screen.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationInitial(StoryScreen(), 'Home')) {
    on<OnNavbarClicked>(onNavbarClicked);
  }

  void onNavbarClicked(NavigationEvent event, Emitter<NavigationState> emit) {
    emit(NavigationChanged(event.activeScreen, event.title));
  }
}
