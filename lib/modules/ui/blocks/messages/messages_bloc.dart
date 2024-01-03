import 'package:firebase_example/core/untils/imports.dart';

part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  MessagesBloc() : super(MessagesState()) {
    on<SendMessage>((event, emit) async {
      try {
        await FirebaseFirestore.instance
            .collection(
          "messages",
        )
            .add({
          'uid': event.getterUid + FirebaseAuth.instance.currentUser!.uid,
          'message': event.message,
          'getterName': event.getterName,
          'senderName': FirebaseAuth.instance.currentUser!.displayName,
          'getterUid': event.getterUid,
          'senderUid': FirebaseAuth.instance.currentUser!.uid,
          'dateTime': DateTime.now(),
        });

        await FirebaseFirestore.instance
            .collection(
              'chats',
            )
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set(
          {
            'senderUid': FirebaseAuth.instance.currentUser!.uid,
            'senderName': FirebaseAuth.instance.currentUser!.displayName,
            'getterUid': event.getterUid,
            'getterName': event.getterName,
            'uid': event.getterUid + FirebaseAuth.instance.currentUser!.uid,
            'lastestMessage': event.message,
            'date': DateTime.now(),
          },
          SetOptions(
            merge: true,
          ),
        );
        await ZegoUIKitPrebuiltCallInvitationService().init(
          appID: CallItems.appId /*input your AppID*/,
          appSign: CallItems.appSignIn /*input your AppSign*/,
          userID: FirebaseAuth.instance.currentUser!.uid,
          userName: FirebaseAuth.instance.currentUser!.displayName!,
          plugins: [
            ZegoUIKitSignalingPlugin(),
          ],
        );
      } catch (e) {}
    });
  }
}
