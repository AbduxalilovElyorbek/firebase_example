import 'package:firebase_example/constants/colors/colors.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
    this.text,
    required this.title,
  });
  final String title;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: lightWhite,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            text!,
            style: TextStyle(
              color: dark,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
