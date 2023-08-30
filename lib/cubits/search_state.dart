import 'package:untitled/models/search_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final SearchModel model;

  SearchSuccess(this.model);



}

class SearchError extends SearchState {
  final error;

  SearchError(this.error);
}