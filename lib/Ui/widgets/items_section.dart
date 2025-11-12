import 'package:collaborativeshoppinglistapp/Core/utils/app_styles.dart';
import 'package:collaborativeshoppinglistapp/Ui/widgets/item_row_text_field.dart';
import 'package:collaborativeshoppinglistapp/Ui/widgets/item_text_field.dart';
import 'package:flutter/material.dart';

class ItemsSection extends StatelessWidget {
  const ItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Items",style: AppStyles.styleBold18,),
        SizedBox(
          height: 16,
        ),
        ItemTextField(itemController: TextEditingController(), onAddPressed: (){}),
        SizedBox(
          height: 20,
        ),
        ItemRowTextField(controller: TextEditingController(), onConfirmPressed: (){}, text: 'Milk (1 Gallon)',),
        SizedBox(
          height: 8,
        ),
        ItemRowTextField(controller: TextEditingController(), onConfirmPressed: (){}, text: 'Bread',),
                SizedBox(
          height: 8,
        ),
        ItemRowTextField(controller: TextEditingController(), onConfirmPressed: (){}, text: 'Eggs (Dozen)',),
      ],
    );
  }
}