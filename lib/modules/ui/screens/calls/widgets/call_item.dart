import 'package:firebase_example/core/untils/imports.dart';
import 'package:firebase_example/modules/ui/screens/calls/widgets/call.dart';
import 'package:firebase_example/modules/ui/screens/profile/profile_screen.dart';

class CallItemWidget extends StatelessWidget {
  const CallItemWidget({
    super.key,
    required this.userName,
    required this.userUid,
    required this.getterUid,
  });
  final String userName;
  final String userUid;
  final String getterUid;

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
                        uid: getterUid,
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
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Call(
                        isVideo: false,
                        userName:
                            FirebaseAuth.instance.currentUser!.displayName!,
                        userId: FirebaseAuth.instance.currentUser!.uid,
                        callID: getterUid,
                      ),
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  AppIcons.call,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Call(
                        userName:
                            FirebaseAuth.instance.currentUser!.displayName!,
                        isVideo: true,
                        userId: FirebaseAuth.instance.currentUser!.uid,
                        callID: "1",
                      ),
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  AppIcons.videoIcon,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
