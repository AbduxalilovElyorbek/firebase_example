import 'package:firebase_example/core/untils/call_items.dart';
import 'package:firebase_example/core/untils/imports.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class Call extends StatelessWidget {
  const Call({
    super.key,
    required this.callID,
    required this.userId,
    required this.userName,
    required this.isVideo,
  });
  final String callID;
  final String userId;
  final String userName;
  final bool isVideo;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: CallItems
          .appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: CallItems
          .appSignIn, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: userId,
      userName: userName,
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: isVideo
          ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall(),
    );
  }
}
