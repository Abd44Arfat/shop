part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}
class ProductsLoading extends ProductsState {}
class ProductsSuccess extends ProductsState {}
class ProductsFailure extends ProductsState {}
class CartAddedSuccess extends ProductsState {
  final CartAddedModel model;

  CartAddedSuccess(this.model);

}
class ChangeCartAddedSuccess extends ProductsState {}
class CartAddedFailure extends ProductsState {}

class GetFavSuccess extends ProductsState {}
class GetFavFailure extends ProductsState {}