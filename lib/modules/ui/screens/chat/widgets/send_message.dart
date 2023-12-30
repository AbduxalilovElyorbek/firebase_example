import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_example/constants/colors/colors.dart';
import 'package:flutter/material.dart';

class SendedMessages extends StatelessWidget {
  const SendedMessages({
    super.key,
    required this.userName,
    required this.message,
    required this.date,
    this.image,
  });
  final String userName;
  final String message;
  final Timestamp date;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            image != null && image != ''
                ? CircleAvatar(
                    radius: 20,
                    backgroundColor: sendedMessageColor,
                    backgroundImage: AssetImage(image!),
                  )
                : Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: sendedMessageColor,
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        userName[0],
                        style: TextStyle(
                          fontSize: 18,
                          color: dark,
                        ),
                      ),
                    ),
                  ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 6,
                ),
                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: sendedMessageColor,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(0),
                    ),
                  ),
                  child: Text(
                    message,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: dark,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
