import 'package:collaborativeshoppinglistapp/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ListNameTextField extends StatelessWidget {
  ListNameTextField({super.key});
  final TextEditingController listNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: listNameController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 17),
        filled: true,
        fillColor: Color(0xffEEF0EE),
        hintText: 'e.g., Weekly Groceries',
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Color(0xffDADADA)),
      );
  }
}
