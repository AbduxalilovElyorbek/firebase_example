import 'package:firebase_example/core/untils/imports.dart';
import 'package:firebase_example/modules/ui/screens/profile/profile_screen.dart';

class ContactItemWidget extends StatelessWidget {
  const ContactItemWidget({
    super.key,
    required this.userName,
    required this.uid,
  });
  final String userName;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Avatar(
                user: userName,
                size: 52,
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(
                        userName: userName,
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
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
