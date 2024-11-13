part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitialState extends AuthState {}

/// Login States
class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final String? message;

  LoginSuccessState({this.message});
}

class LoginErrorState extends AuthState {
  final String? message;

  LoginErrorState({this.message});
}

/// Verify Reset Code Of Login States
class VerifyResetPasswordLoadingState extends AuthState {}

class VerifyResetPasswordSuccessState extends AuthState {
  final String? message;

  VerifyResetPasswordSuccessState({this.message});
}

class VerifyResetPasswordErrorState extends AuthState {
  final String? message;

  VerifyResetPasswordErrorState({this.message});
}