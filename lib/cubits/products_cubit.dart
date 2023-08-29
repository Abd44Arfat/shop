import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/products_model.dart';

import '../shared/dio_helper.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductModel? homeModel;
  Map<int, bool> cartadded = {};

  static ProductsCubit get(context) => BlocProvider.of(context);

  ProductsCubit() : super(ProductsInitial());

  Future<void> fetchHomeData() async {
    emit(ProductsLoading());

    try {
      final response = await Dio().get('https://student.valuxapps.com/api/home',
          options: Options(
            headers: {
              "Authorization":
                  "cTqSB340bFBAwEaL2xMJhwQYpHnE6AnRgqXnDHJNtG3cAr3UgNRKbT7WhUXIraKqdECCaC"
            },
          ));

      homeModel = ProductModel.fromJson(response.data);
      homeModel?.data.products.forEach((element) {
        cartadded.addAll({element.id: element.inFavorites});

        print(cartadded.toString());
      });

      emit(ProductsSuccess());
    } catch (e) {
      print('Error: $e');
      emit(ProductsFailure());
    }
  }

  void CangeCartadded(int ProductId) {
    DioHelper.postData(
            url: 'favorites',
            data: {'product_id': ProductId},
            token:
                'cTqSB340bFBAwEaL2xMJhwQYpHnE6AnRgqXnDHJNtG3cAr3UgNRKbT7WhUXIraKqdECCaC')
        .then((value) {emit(CartAddedSuccess());})
        .catchError((error) {emit(CartAddedFailure());});
  }
}
