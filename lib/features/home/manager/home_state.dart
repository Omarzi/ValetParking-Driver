part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}

/// Make Attendance In Start States
final class MakeAttendanceInStartLoadingState extends HomeInitialState {}

final class MakeAttendanceInStartSuccessState extends HomeInitialState {
  final String? message;

  MakeAttendanceInStartSuccessState({this.message});
}

final class MakeAttendanceInStartErrorState extends HomeInitialState {
  final String? message;

  MakeAttendanceInStartErrorState({this.message});
}

/// Make Attendance In End States
final class MakeAttendanceInEndLoadingState extends HomeInitialState {}

final class MakeAttendanceInEndSuccessState extends HomeInitialState {
  final String? message;

  MakeAttendanceInEndSuccessState({this.message});
}

final class MakeAttendanceInEndErrorState extends HomeInitialState {
  final String? message;

  MakeAttendanceInEndErrorState({this.message});
}

/// Add New User States
final class AddNewUserLoadingState extends HomeInitialState {}

final class AddNewUserSuccessState extends HomeInitialState {
  final String? message;

  AddNewUserSuccessState({this.message});
}

final class AddNewUserErrorState extends HomeInitialState {
  final String? message;

  AddNewUserErrorState({this.message});
}

/// Make new order States
final class MakeNewOrderLoadingState extends HomeState {}

final class MakeNewOrderSuccessState extends HomeState {
  final String? message;
  // final MakeOrderResponseModel makeOrderResponseModel;

  MakeNewOrderSuccessState({this.message,
    // required this.makeOrderResponseModel,
  });
}

final class MakeNewOrderErrorState extends HomeState {
  final String? message;

  MakeNewOrderErrorState({this.message});
}


/// Make Scan States
final class MakeScanLoadingState extends HomeState {}

final class MakeScanSuccessState extends HomeState {
  final String? message;

  MakeScanSuccessState({this.message});
}

final class MakeScanErrorState extends HomeState {
  final String? message;

  MakeScanErrorState({this.message});
}
