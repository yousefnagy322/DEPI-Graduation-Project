import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collaborativeshoppinglistapp/Data/item_model.dart';
import 'package:flutter/material.dart';

part 'add_item_state.dart';

class AddItemCubit extends Cubit<AddItemState> {
  AddItemCubit() : super(const AddItemState());

  void addItem(String name) {
    if (name.trim().isEmpty) return;
    
    final now = DateTime.now();
    final itemId = DateTime.now().millisecondsSinceEpoch.toString();
    
    final newItem = ItemModel(
      id: "",
      itemId: itemId,
      name: name.trim(),
      ownerId: "Raq3HjmPFKAGUFbf4fEA",
      checked: false,
      createdAt: now,
      updatedAt: now,
    );

    final updated = List<ItemModel>.from(state.items)..add(newItem);

    emit(AddItemState(items: updated));
  }

  void removeItem(int index) {
    if (index >= 0 && index < state.items.length) {
      final updated = List<ItemModel>.from(state.items)..removeAt(index);
      emit(AddItemState(items: updated));
    }
  }

  void removeItemById(String itemId) {
    final updated = state.items.where((item) => item.itemId != itemId).toList();
    emit(AddItemState(items: updated));
  }

  void clearItems() {
    emit(const AddItemState(items: []));
  }
}
