import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_example/constants/colors/colors.dart';
import 'package:flutter/material.dart';

class MyMessages extends StatelessWidget {
  const MyMessages({
    super.key,
    required this.message,
    required this.date,
  });
  final String message;
  final Timestamp date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: myMessageColor,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  topRight: Radius.circular(0),
                  topLeft: Radius.circular(12),
                ),
              ),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${date.toDate().hour} : ${date.toDate().minute}",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: time,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
