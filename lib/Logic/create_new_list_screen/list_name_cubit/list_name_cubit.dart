import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'list_name_state.dart';

class ListNameCubit extends Cubit<ListNameState> {
  ListNameCubit() : super(const ListNameState());

  void setListName(String name) {
    emit(ListNameState(listName: name));
  }

  void clearListName() {
    emit(const ListNameState());
  }
}

