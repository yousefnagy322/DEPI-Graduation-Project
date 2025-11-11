import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collaborativeshoppinglistapp/Data/list_model.dart';
import 'package:collaborativeshoppinglistapp/Logic/HomeScreen/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  Future getlists() async {
    emit(HomeScreenLoadingState());

    try {
      final owenedlistsnapshot = await FirebaseFirestore.instance
          .collection('shopping_lists')
          .where('ownerId', isEqualTo: 'Raq3HjmPFKAGUFbf4fEA')
          .get();

      final owenedlists = owenedlistsnapshot.docs
          .map((doc) => ShoppingList.fromFirestore(doc))
          .toList();

      final sharedlistsnapshot = await FirebaseFirestore.instance
          .collection('shopping_lists')
          .where('collaborators', arrayContains: 'Raq3HjmPFKAGUFbf4fEA')
          .get();

      final sharedlists = sharedlistsnapshot.docs
          .map((doc) => ShoppingList.fromFirestore(doc))
          .toList();

      final shoppinglists = [...owenedlists, ...sharedlists];

      await Future.wait(
        shoppinglists.map((list) async {
          final itemsSnapshot = await FirebaseFirestore.instance
              .collection('shopping_lists')
              .doc(list.id)
              .collection('items')
              .get();

          list.itemsCount = itemsSnapshot.docs.length;
        }),
      );

      emit(HomeScreenSuccessState(lists: shoppinglists));
    } catch (e) {
      emit(HomeScreenErrorState(error: e.toString()));
    }
  }
}
