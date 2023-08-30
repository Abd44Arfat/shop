import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/cubits/search_state.dart';
import 'package:untitled/models/search_model.dart';



class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());


  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? model;
  Future<SearchModel?>Search(String text) async {

    emit(SearchLoading());
    try {
      final response = await Dio().post(
        'https://student.valuxapps.com/api/products/search',
        data: {'text': text},
        options: Options(
          headers: {
            'lang':'en',
            "Authorization":
            "qFvifEKX22aX22OLWq92l3hf5RfY3PIYvcHSPtTMs3fJfCMYASAK8MYhSYcYRc2oYMvY03"
          },
        ),
      );

      model = SearchModel.fromJson(response.data);

      print(response.data);


      emit(SearchSuccess(model!));
    } catch (error) {

      emit(SearchError(error));
    }
  }

}
