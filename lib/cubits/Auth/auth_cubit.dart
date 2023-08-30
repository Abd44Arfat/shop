import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/models/loginModel.dart';
import 'package:untitled/shared/consatnts.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  LoginModel ?model;
  Future<LoginModel?> login({required String email, required String password}) async {

    emit(LoginLoading());
    try {
      final response = await Dio().post(
        'https://student.valuxapps.com/api/login',
        data: {'email': email,'password':password},
        options: Options(

        ),
      );

      model = LoginModel.fromJson(response.data);

      print(response.data);

      print('##################################################################################');


      print(model!.data.token);
SharedPreferences prefs=await SharedPreferences.getInstance();
prefs.setString(AppConstants.Key_Access_Token, model!.data.token);

      emit(LoginSuccess(model!));
    } catch (error) {
print(error);
      emit(LoginError());
    }
  }

}


