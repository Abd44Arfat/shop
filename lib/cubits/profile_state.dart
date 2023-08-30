part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileSuccess extends ProfileState {

  final LoginModel model1;

  ProfileSuccess(this.model1);

}
class ProfileLoading extends ProfileState {}
class ProfileError extends ProfileState {}
