import 'package:collaborativeshoppinglistapp/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonName, required this.onTap});
  final String buttonName;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Color(0xff49B94D),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: AppStyles.styleBold16.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
