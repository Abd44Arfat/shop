import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/cart_added_model.dart';
import 'package:untitled/models/favourites_model.dart';
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


      });

      emit(ProductsSuccess());
    } catch (e) {
      print('Error: $e');
      emit(ProductsFailure());
    }
  }

  CartAddedModel? cartAddedModel;

  void changeCartAdded(int productId) async {
    cartadded[productId] = !cartadded[productId]!;
    emit(ChangeCartAddedSuccess());
    try {
      final response = await Dio().post(
        'https://student.valuxapps.com/api/favorites',
        data: {'product_id': productId},
        options: Options(
          headers: {
            "Authorization":
            "cTqSB340bFBAwEaL2xMJhwQYpHnE6AnRgqXnDHJNtG3cAr3UgNRKbT7WhUXIraKqdECCaC"
          },
        ),
      );

      cartAddedModel = CartAddedModel.fromJson(response.data);


      if(!cartAddedModel!.status){
        cartadded[productId] = !cartadded[productId]!;

      }
      emit(CartAddedSuccess(cartAddedModel!));
    } catch (e) {
      cartadded[productId] = !cartadded[productId]!;
      print('Error: $e');
      emit(CartAddedFailure());
    }
  }

  FavouritesModel ?favouritesModel;

  Future<void> fetchFavData() async {
    emit(ProductsLoading());

    try {
      final response = await Dio().get('https://student.valuxapps.com/api/favorites',
          options: Options(
            headers: {
              "Authorization":
              "cTqSB340bFBAwEaL2xMJhwQYpHnE6AnRgqXnDHJNtG3cAr3UgNRKbT7WhUXIraKqdECCaC"
            },
          ));

      favouritesModel = FavouritesModel.fromJson(response.data);






      emit(GetFavSuccess());
    } catch (e) {
      print('Error: $e');
      emit(GetFavFailure());
    }
  }
}