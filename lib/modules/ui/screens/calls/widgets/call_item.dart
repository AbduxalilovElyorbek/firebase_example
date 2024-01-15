import 'package:firebase_example/core/untils/imports.dart';

class CallItemWidget extends StatelessWidget {
  const CallItemWidget({
    super.key,
    required this.userUid,
    required this.userName,
    required this.userEmail,
    required this.userNumber,
  });
  final String userUid;
  final String userName;
  final String userEmail;
  final String userNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
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
                      userEmail: userEmail,
                      userNumber: userNumber,
                      uid: userUid,
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
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ZegoSendCallInvitationButton(
              buttonSize: Size(24.w, 24.h),
              isVideoCall: false,
              resourceID: "zegouikit_call",
              invitees: [
                ZegoUIKitUser(
                  id: FirebaseAuth.instance.currentUser!.uid,
                  name: FirebaseAuth.instance.currentUser!.displayName!,
                ),
                ZegoUIKitUser(
                  id: userUid,
                  name: userUid,
                ),
              ],
            ),
            SizedBox(
              width: 8.w,
            ),
            ZegoSendCallInvitationButton(
              isVideoCall: true,
              buttonSize: Size(24.w, 24.h),
              resourceID: "zegouikit_call",
              invitees: [
                ZegoUIKitUser(
                  id: FirebaseAuth.instance.currentUser!.uid,
                  name: FirebaseAuth.instance.currentUser!.displayName!,
                ),
                ZegoUIKitUser(
                  id: userUid,
                  name: userUid,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
