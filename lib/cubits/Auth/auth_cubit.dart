import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/loginModel.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  LoginModel ?model;
  Future login({required String email, required String password}) async {

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


      emit(LoginSuccess());
    } catch (error) {
print(error);
      emit(LoginError());
    }
  }

}


