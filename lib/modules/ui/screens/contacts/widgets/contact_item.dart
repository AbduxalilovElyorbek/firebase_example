import 'package:firebase_example/core/untils/imports.dart';

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
              SizedBox(
                width: 12.w,
              ),
              Text(
                userName,
                style: TextStyle(
                  fontSize: 18.sp,
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
