import 'package:collaborativeshoppinglistapp/Core/utils/app_styles.dart';
import 'package:collaborativeshoppinglistapp/Logic/create_new_list_screen/add_item_cubit/add_item_cubit.dart';
import 'package:collaborativeshoppinglistapp/Logic/create_new_list_screen/list_name_cubit/list_name_cubit.dart';
import 'package:collaborativeshoppinglistapp/Logic/create_new_list_screen/save_list_cubit/save_list_cubit.dart';
import 'package:collaborativeshoppinglistapp/Ui/widgets/create_newList_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewListScreen extends StatelessWidget {
  const CreateNewListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddItemCubit()),
        BlocProvider(create: (context) => ListNameCubit()),
        BlocProvider(create: (context) => SaveListCubit()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Create New List",
              style: AppStyles.styleBold18,
            ),
          ),
        ),
        body: const CreateNewlistScreenBody(),
      ),
    );
  }
}