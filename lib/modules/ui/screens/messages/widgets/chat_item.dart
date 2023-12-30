import 'package:firebase_example/modules/ui/screens/messages/widgets/chat_profile.dart';
import 'package:firebase_example/modules/ui/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.name,
    this.image,
    required this.message,
    required this.isOnline,
    required this.uid,
  });
  final String uid;
  final String name;
  final String? image;
  final String message;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: SizedBox(
        height: 52,
        width: 327,
        child: Row(
          children: [
            ChatProfile(
              isActive: isOnline,
              letter: name[0],
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      userName: name,
                      userEmail: 'user.email!',
                      userNumber: 'user.phoneNumber',
                      uid: uid,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    message,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  isOnline ? 'Active' : 'Is not Active',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                // Container(
                //   height: 22,
                //   width: 22,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(
                //       50,
                //     ),
                //     color: orange,
                //   ),
                //   child: Center(
                //     child: Text(
                //       "",
                //       style: TextStyle(
                //         fontSize: 12,
                //         fontWeight: FontWeight.w400,
                //         color: white,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
