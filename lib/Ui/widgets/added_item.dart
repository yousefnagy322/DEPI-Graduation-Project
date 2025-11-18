import 'package:collaborativeshoppinglistapp/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AddedItem extends StatelessWidget {
  const AddedItem({
    super.key,
    required this.itemName,
    required this.itemId,
    required this.onTap,
  });
  
  final String itemName;
  final String itemId;
  final void Function() onTap;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xffF2F4F2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              itemName,
              style: AppStyles.styleRegular16.copyWith(color: Colors.black),
            ),
          ),
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: const Icon(
              Icons.delete_outline,
              color: Color(0xff848484),
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
