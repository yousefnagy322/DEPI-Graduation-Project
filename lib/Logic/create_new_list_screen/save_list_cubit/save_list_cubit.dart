import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collaborativeshoppinglistapp/Data/item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'save_list_state.dart';

class SaveListCubit extends Cubit<SaveListState> {
  SaveListCubit() : super(SaveListInitialState());

  Future<void> saveList({
    required String listName,
    required List<ItemModel> items,
    required String ownerId,
  }) async {
    if (listName.trim().isEmpty) {
      emit(SaveListErrorState(error: "List name cannot be empty"));
      return;
    }
    emit(SaveListLoadingState());
    try {
      final now = DateTime.now();
      final listRef = await FirebaseFirestore.instance
          .collection('shopping_lists')
          .add({
            'name': listName.trim(),
            'ownerId': ownerId,
            'createdAt': Timestamp.fromDate(now),
            'updatedAt': Timestamp.fromDate(now),
            'itemsCount': items.length,
          });
      if (items.isNotEmpty) {
        final batch = FirebaseFirestore.instance.batch();
        for (var item in items) {
          final itemRef = listRef.collection('items').doc();
          batch.set(itemRef, {...item.toFirestore(), 'id': item.itemId});
        }
        await batch.commit();
      }
      emit(SaveListSuccessState(listId: listRef.id));
    } catch (e) {
      emit(SaveListErrorState(error: e.toString()));
    }
  }
}
