import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/loginModel.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);


  LoginModel ?model;

  Future<void> fetchProfileData() async {
    emit(ProfileLoading());

    try {
      final response = await Dio().get('https://student.valuxapps.com/api/profile',
          options: Options(
            headers: {
              "Authorization":
              "5zrhBwKD1PtUC9xghfvA3ywGz4rffSmTj9F5PXmNwAYFw4HwefZYtc3RDMeco5VCyh7trk"
            },
          ));

      model = LoginModel.fromJson(response.data);
print(response.data);
print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Nmae   %%%%%%%%%%%%%%%%%%%%%%%%%%%%");
print(model!.data.name);
      emit(ProfileSuccess(model!));
    } catch (e) {
      print('Error: $e');
      emit(ProfileError());



}}}
