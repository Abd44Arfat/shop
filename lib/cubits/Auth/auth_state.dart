part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class LoginSuccess extends AuthState {

 final LoginModel model;

  LoginSuccess(this.model);
}
class LoginLoading extends AuthState {}
class LoginError extends AuthState {}
