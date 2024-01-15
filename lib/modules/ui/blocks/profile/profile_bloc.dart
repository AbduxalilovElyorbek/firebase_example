import 'package:firebase_example/core/untils/imports.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final _user = FirebaseAuth.instance.currentUser!;
  ProfileBloc() : super(const ProfileState()) {
    on<EditUser>((event, emit) async {
      try {
        await _user.updateDisplayName(
          event.userName,
        );
        await _user.updateEmail(
          event.email,
        );
        await _user.updatePhoneNumber(
          event.number as PhoneAuthCredential,
        );

        await FirebaseFirestore.instance
            .collection(
              'users',
            )
            .doc(_user.uid)
            .set(
          {
            'email': event.email,
            'name': event.userName,
            'phone_number': event.number,
            'bio': event.bio,
          },
          SetOptions(
            merge: true,
          ),
        );
      } catch (e) {}
    });
  }
}
