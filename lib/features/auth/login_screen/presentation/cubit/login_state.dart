part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String token;
  final String name;
  LoginSuccess({required this.token, required this.name});
}

final class LoginError extends LoginState {}
