import 'package:collaborativeshoppinglistapp/Logic/create_new_list_screen/add_item_cubit/add_item_cubit.dart';
import 'package:collaborativeshoppinglistapp/Logic/create_new_list_screen/list_name_cubit/list_name_cubit.dart';
import 'package:collaborativeshoppinglistapp/Logic/create_new_list_screen/save_list_cubit/save_list_cubit.dart';
import 'package:collaborativeshoppinglistapp/Ui/screens/home_screen.dart';
import 'package:collaborativeshoppinglistapp/Ui/widgets/custom_button.dart';
import 'package:collaborativeshoppinglistapp/Ui/widgets/items_section.dart';
import 'package:collaborativeshoppinglistapp/Ui/widgets/list_name_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewlistScreenBody extends StatelessWidget {
  const CreateNewlistScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SaveListCubit, SaveListState>(
      listener: (context, state) {
        if (state is SaveListSuccessState) {
          context.read<AddItemCubit>().clearItems();
          context.read<ListNameCubit>().clearListName();
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('List saved successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is SaveListErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListNameSection(),
                          SizedBox(height: 23),
                          ItemsSection(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                 Spacer(),
                BlocBuilder<SaveListCubit, SaveListState>(
                  builder: (context, saveState) {
                    final isLoading = saveState is SaveListLoadingState;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CustomButton(
                        buttonName: isLoading ? "Saving..." : "Save List",
                        onTap: isLoading
                            ? null
                            : () {
                                final listNameState =
                                    context.read<ListNameCubit>().state;
                                final itemsState =
                                    context.read<AddItemCubit>().state;

                                context.read<SaveListCubit>().saveList(
                                      listName: listNameState.listName,
                                      items: itemsState.items,
                                      ownerId: "Raq3HjmPFKAGUFbf4fEA",
                                    );
                              },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Expanded(child: Container(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
