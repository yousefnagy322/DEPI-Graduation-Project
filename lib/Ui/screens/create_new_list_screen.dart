import 'package:collaborativeshoppinglistapp/Core/utils/app_styles.dart';
import 'package:collaborativeshoppinglistapp/Ui/widgets/create_newList_screen_body.dart';
import 'package:flutter/material.dart';

class CreateNewListScreen extends StatelessWidget {
  const CreateNewListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(child: Text("Create New List",style: AppStyles.styleBold18,)),
      ),
      body: CreateNewlistScreenBody(),
    );
  }
}