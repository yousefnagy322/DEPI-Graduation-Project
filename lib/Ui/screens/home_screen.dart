import 'package:collaborativeshoppinglistapp/Core/colors_manager.dart';
import 'package:collaborativeshoppinglistapp/Ui/widgets/main_list_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Column(children: [MainListWidget()]),
    );
  }
}
