part of 'save_list_cubit.dart';

@immutable
class SaveListState {}

class SaveListInitialState extends SaveListState {}

class SaveListLoadingState extends SaveListState {}

class SaveListSuccessState extends SaveListState {
  final String listId;
  
  SaveListSuccessState({required this.listId});
}

class SaveListErrorState extends SaveListState {
  final String error;
  
  SaveListErrorState({required this.error});
}

