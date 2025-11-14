import 'package:collaborativeshoppinglistapp/Ui/screens/create_new_list_screen.dart';
import 'package:collaborativeshoppinglistapp/Ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Testscreen extends StatelessWidget {
  const Testscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.blue),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
        child: Text('click me :D', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
