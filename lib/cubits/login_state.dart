part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginSucess extends LoginState {}
final class LoginFailed extends LoginState {
  final String message;
  LoginFailed(this.message);
}
