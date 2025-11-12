import 'package:collaborativeshoppinglistapp/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ItemRowTextField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onConfirmPressed;
  final String text;
  const ItemRowTextField({
    super.key,
    required this.controller,
    required this.onConfirmPressed, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 17),
        filled: true,
        fillColor: const Color(0xffEEF0EE),
        hintStyle: AppStyles.styleRegular16.copyWith(color: Colors.black),
        hintText:text,
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: InkWell(
            onTap: onConfirmPressed,
            borderRadius: BorderRadius.circular(16),
            child: Icon(
              Icons.delete_outline,
              color: Color(0xff848484),
              size: 28,
            ),
          ),
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
