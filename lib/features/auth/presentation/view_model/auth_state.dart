
part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final LoginEntity loginEntity;

  LoginSuccess(this.loginEntity);
}

final class LoginError extends AuthState {
  final String errorMessage;

  LoginError(this.errorMessage);
}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {
  final SignUpEntity signUpEntity;

  SignUpSuccess(this.signUpEntity);
}

final class SignUpError extends AuthState {
  final String errorMessage;

  SignUpError(this.errorMessage);
}
