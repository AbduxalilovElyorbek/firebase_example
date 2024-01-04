import 'package:firebase_example/core/untils/imports.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.name,
    this.message,
    required this.uid,
    this.image,
    this.isOnline,
  });

  final String uid;
  final String name;
  final String? message;

  final String? image;
  final bool? isOnline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
      ),
      child: SizedBox(
        height: 52.h,
        width: 320.w,
        child: Row(
          children: [
            ChatProfile(
              isActive: isOnline!,
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
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                message != null
                    ? Padding(
                        padding: EdgeInsets.only(
                          top: 6.h,
                        ),
                        child: SizedBox(
                          width: 100.w,
                          child: Text(
                            message!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            const Spacer(),
            Text(
              '',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
