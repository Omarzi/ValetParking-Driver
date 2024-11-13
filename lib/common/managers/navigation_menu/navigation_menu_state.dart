part of 'navigation_menu_cubit.dart';

@immutable
sealed class NavigationMenuState {}

final class NavigationMenuInitialState extends NavigationMenuState {}

/// Make Garage Activate Or Not States
final class MakeGarageActiveOrNotLoadingState extends NavigationMenuState {}

final class MakeGarageActiveOrNotSuccessState extends NavigationMenuState {
  final String? message;

  MakeGarageActiveOrNotSuccessState({this.message});
}

final class MakeGarageActiveOrNotErrorState extends NavigationMenuState {
  final String? message;

  MakeGarageActiveOrNotErrorState({this.message});
}