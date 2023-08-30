import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/register_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  RegisterModel ?model;

  Future<RegisterModel?> register({required String email, required String password,required String name,required String phone}) async {

    emit(RegisterLoading());
    try {
      final response = await Dio().post(
        'https://student.valuxapps.com/api/register',
        data: {"name":name,'email': email,'password':password,"phone":phone},
        options: Options(

        ),
      );

      model = RegisterModel.fromJson(response.data);

      print(response.data);


      emit(RegisterSuccess(model!));
    } catch (error) {
      print(error);
      emit(RegisterError());
    }
  }

}


