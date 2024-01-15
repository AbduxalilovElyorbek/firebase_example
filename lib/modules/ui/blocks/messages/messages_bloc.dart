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
            'email': FirebaseAuth.instance.currentUser!.email,
            'number': FirebaseAuth.instance.currentUser!.phoneNumber,
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
          appID: ProjectItems.appId /*input your AppID*/,
          appSign: ProjectItems.appSignIn /*input your AppSign*/,
          userID: FirebaseAuth.instance.currentUser!.uid,
          userName: FirebaseAuth.instance.currentUser!.displayName!,
          plugins: [
            ZegoUIKitSignalingPlugin(),
          ],
        );
      } catch (e) {}
    });

    on<SendImage>((event, emit) async {
      try {
        final picker = ImagePicker();
        final pickedFile = await picker.pickImage(
          source: event.isCamera ? ImageSource.camera : ImageSource.gallery,
        );

        if (pickedFile != null) {
          final storageRef =
              FirebaseStorage.instance.ref().child('images/${pickedFile.name}');

          final uploadTask = storageRef.putFile(File(pickedFile.path));

          final snapshot = await uploadTask.whenComplete(() => null);
          final downloadUrl = await snapshot.ref.getDownloadURL();

          print('Image uploaded to: $downloadUrl');
        }
      } on FirebaseException catch (e) {
        // Handle any errors
        print(e);
      }
    });
  }
}
