part of 'navigation_bloc.dart';

sealed class NavigationState extends Equatable {
  final Widget? activeScreen;
  final String? title;

  const NavigationState({this.activeScreen, this.title});

  @override
  List<Object?> get props => [activeScreen, title];
}

final class NavigationInitial extends NavigationState {
  const NavigationInitial(final Widget? activeScreen, final String? title)
      : super(activeScreen: activeScreen, title: title);
}

class NavigationChanged extends NavigationState {
  const NavigationChanged(final Widget? activeScreen, final String? title)
      : super(activeScreen: activeScreen, title: title);
}
