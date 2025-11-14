import 'package:collaborativeshoppinglistapp/Core/utils/app_styles.dart';
import 'package:collaborativeshoppinglistapp/Logic/create_new_list_screen/add_item_cubit/add_item_cubit.dart';
import 'package:collaborativeshoppinglistapp/Ui/widgets/added_item_view.dart';
import 'package:collaborativeshoppinglistapp/Ui/widgets/item_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsSection extends StatefulWidget {
  const ItemsSection({super.key});

  @override
  State<ItemsSection> createState() => _ItemsSectionState();
}

class _ItemsSectionState extends State<ItemsSection> {
  final TextEditingController itemController = TextEditingController();

  @override
  void dispose() {
    itemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Items", style: AppStyles.styleBold18),
        const SizedBox(height: 16),
        ItemTextField(
          itemController: itemController,
          onAddPressed: () {
            final cubit = context.read<AddItemCubit>();
            cubit.addItem(itemController.text);
            itemController.clear();
          },
        ),
        const SizedBox(height: 20),
        const AddedItemView(),
      ],
    );
  }
}
