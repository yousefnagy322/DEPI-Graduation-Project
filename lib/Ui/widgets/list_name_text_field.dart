import 'package:collaborativeshoppinglistapp/Logic/create_new_list_screen/list_name_cubit/list_name_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListNameTextField extends StatefulWidget {
  const ListNameTextField({super.key});

  @override
  State<ListNameTextField> createState() => _ListNameTextFieldState();
}

class _ListNameTextFieldState extends State<ListNameTextField> {
  late final TextEditingController _controller;
  bool _isUpdatingFromCubit = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ListNameCubit, ListNameState>(
      listener: (context, state) {
        if (!_isUpdatingFromCubit && _controller.text != state.listName) {
          _controller.text = state.listName;
        }
      },
      child: TextField(
        controller: _controller,
        onChanged: (value) {
          _isUpdatingFromCubit = true;
          context.read<ListNameCubit>().setListName(value);
          _isUpdatingFromCubit = false;
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
          filled: true,
          fillColor: const Color(0xffEEF0EE),
          hintText: 'e.g., Weekly Groceries',
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Color(0xffDADADA)),
    );
  }
}
