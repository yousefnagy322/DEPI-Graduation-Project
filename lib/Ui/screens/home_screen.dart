import 'package:collaborativeshoppinglistapp/Core/colors_manager.dart';
import 'package:collaborativeshoppinglistapp/Logic/HomeScreen/cubit.dart';
import 'package:collaborativeshoppinglistapp/Logic/HomeScreen/state.dart';
import 'package:collaborativeshoppinglistapp/Ui/widgets/main_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String formatUpdated(DateTime date) {
    return "Updated ${timeago.format(date)}";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit()..getlists(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: Color(0xff4BBE4F),
          onPressed: () {},
          child: Icon(Icons.add, color: Colors.white),
        ),
        appBar: AppBar(
          backgroundColor: ColorsManager.background,
          shape: Border.fromBorderSide(BorderSide(color: Color(0xffE5E7EB))),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Image.asset('assets/Images/profile.png'),
            ),
          ],
          title: Text(
            'My Shopping Lists',
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              color: Color(0xff333333),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        backgroundColor: ColorsManager.background,
        body: BlocBuilder<HomeScreenCubit, HomeScreenState>(
          builder: (context, state) {
            if (state is HomeScreenLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeScreenErrorState) {
              return Center(child: Text(state.error));
            } else if (state is HomeScreenSuccessState) {
              return ListView.builder(
                padding: const EdgeInsets.only(top: 24),
                itemCount: state.lists.length,
                itemBuilder: (context, index) => MainListWidget(
                  listName: state.lists[index].name,
                  itemcount: state.lists[index].itemsCount.toString(),
                  updatedAt: formatUpdated(state.lists[index].updatedAt),
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
