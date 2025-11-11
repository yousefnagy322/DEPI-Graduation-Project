import 'package:collaborativeshoppinglistapp/Data/list_model.dart';

class HomeScreenState {}

class HomeScreenInitialState extends HomeScreenState {}

class HomeScreenLoadingState extends HomeScreenState {}

class HomeScreenSuccessState extends HomeScreenState {
  List<ShoppingList> lists;
  HomeScreenSuccessState({required this.lists});
}

class HomeScreenErrorState extends HomeScreenState {
  String error;
  HomeScreenErrorState({required this.error});
}
