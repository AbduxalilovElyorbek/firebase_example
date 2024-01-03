import 'package:firebase_example/core/untils/imports.dart';

class CallItemWidget extends StatelessWidget {
  const CallItemWidget({
    super.key,
    required this.userName,
    required this.userUid,
  });
  final String userName;
  final String userUid;

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
            children: [
              ZegoSendCallInvitationButton(
                isVideoCall: true,
                resourceID:
                    "zegouikit_call", //You need to use the resourceID that you created in the subsequent steps. Please continue reading this document.
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
              )

              // IconButton(
              //   onPressed: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) => Call(
              //           isVideo: false,
              //           userName:
              //               FirebaseAuth.instance.currentUser!.displayName!,
              //           userId: FirebaseAuth.instance.currentUser!.uid,
              //           callID: getterUid,
              //         ),
              //       ),
              //     );
              //   },
              //   icon: SvgPicture.asset(
              //     AppIcons.call,
              //   ),
              // ),
              // IconButton(
              //   onPressed: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) => Call(
              //           userName:
              //               FirebaseAuth.instance.currentUser!.displayName!,
              //           isVideo: true,
              //           userId: FirebaseAuth.instance.currentUser!.uid,
              //           callID: "1",
              //         ),
              //       ),
              //     );
              //   },
              //   icon: SvgPicture.asset(
              //     AppIcons.videoIcon,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
