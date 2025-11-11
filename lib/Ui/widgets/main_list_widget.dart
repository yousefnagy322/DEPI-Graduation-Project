import 'package:flutter/material.dart';

class MainListWidget extends StatelessWidget {
  String listName;
  String itemcount;
  String updatedAt;

  MainListWidget({
    super.key,
    required this.listName,
    required this.itemcount,
    required this.updatedAt,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print(screenHeight); //804
    print(screenWidth); //360
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      child: Container(
        height: screenHeight * 0.1679,
        width: double.infinity,

        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x0D000000),
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listName,
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: screenWidth * 0.041,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '$itemcount item •\n $updatedAt',
                    style: TextStyle(
                      color: Color(0xff888888),
                      fontFamily: 'PlusJakartaSans',
                      fontSize: screenWidth * 0.0359,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                'assets/Images/Image.png',
                height: screenHeight * 0.128,
                width: screenWidth * 0.286,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
