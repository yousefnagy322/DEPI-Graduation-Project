import 'package:collaborativeshoppinglistapp/Core/utils/app_styles.dart';
import 'package:collaborativeshoppinglistapp/Ui/widgets/list_name_text_field.dart';
import 'package:flutter/material.dart';

class ListNameSection extends StatelessWidget {
  const ListNameSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("List Name",style: AppStyles.styleMedium16,),
        SizedBox(
          height: 8,
        ),
        ListNameTextField()
      ],
    );
  }
}