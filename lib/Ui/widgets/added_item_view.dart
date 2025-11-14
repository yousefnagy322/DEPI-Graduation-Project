import 'package:collaborativeshoppinglistapp/Logic/create_new_list_screen/add_item_cubit/add_item_cubit.dart';
import 'package:collaborativeshoppinglistapp/Ui/widgets/added_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddedItemView extends StatelessWidget {
  const AddedItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddItemCubit, AddItemState>(
      builder: (context, state) {
        if (state.items.isEmpty) {
          return const SizedBox.shrink();
        }
        return ListView.builder(
          shrinkWrap: true,
          physics:  NeverScrollableScrollPhysics(),
          itemCount: state.items.length,
          itemBuilder: (context, index) {
            final item = state.items[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: AddedItem(
                itemName: item.name,
                itemId: item.itemId,
                onTap: () {
                  context.read<AddItemCubit>().removeItemById(item.itemId);
                },
              ),
            );
          },
        );
      },
    );
  }
}
