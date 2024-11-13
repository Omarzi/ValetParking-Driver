part of 'orders_in_specific_garage_cubit.dart';

@immutable
sealed class OrdersInSpecificGarageState {}

final class OrdersInSpecificGarageInitialState
    extends OrdersInSpecificGarageState {}

final class OrdersInSpecificGarageLoadingState
    extends OrdersInSpecificGarageState {}

final class OrdersInSpecificGarageSuccessState
    extends OrdersInSpecificGarageState {
  final String? message;

  OrdersInSpecificGarageSuccessState({this.message});
}

final class OrdersInSpecificGarageErrorState
    extends OrdersInSpecificGarageState {
  final String? message;

  OrdersInSpecificGarageErrorState({this.message});
}

/// Get Specific Order States
final class GetSpecificOrderLoadingState extends OrdersInSpecificGarageState {}

final class GetSpecificOrderSuccessState extends OrdersInSpecificGarageState {
  final String? message;

  GetSpecificOrderSuccessState({this.message});
}

final class GetSpecificOrderErrorState extends OrdersInSpecificGarageState {
  final String? message;

  GetSpecificOrderErrorState({this.message});
}
