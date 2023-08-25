part of 'navigation_bloc.dart';

sealed class NavigationEvent extends Equatable {
  final Widget? activeScreen;
  final String? title;

  const NavigationEvent({this.activeScreen, this.title});

  @override
  List<Object?> get props => [activeScreen, title];
}

class OnNavbarClicked extends NavigationEvent {
  const OnNavbarClicked(final Widget? activeScreen, final String? title)
      : super(activeScreen: activeScreen, title: title);
}
