part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class LoginSuccess extends AuthState {}
class LoginLoading extends AuthState {}
class LoginError extends AuthState {}
