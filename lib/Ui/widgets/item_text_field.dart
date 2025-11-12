import 'package:flutter/material.dart';

class ItemTextField extends StatelessWidget {
  final TextEditingController itemController;
  final VoidCallback onAddPressed;

  const ItemTextField({
    super.key,
    required this.itemController,
    required this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: itemController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
        filled: true,
        fillColor: const Color(0xffEEF0EE),
        hintText: 'e.g., Milk',
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        suffixIcon: InkWell(
          onTap: onAddPressed,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xff49B94D),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),topRight: Radius.circular(10)),
            ),
            child: const Icon(Icons.add, color: Colors.white),
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
