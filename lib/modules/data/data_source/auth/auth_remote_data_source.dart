import 'package:dartz/dartz.dart';
import 'package:firebase_example/core/untils/imports.dart';


abstract class AuthRemoteDataSource {
  ResultFuture register({
    required String name,
    required String email,
    required String password,
  });
  ResultFuture login({
    required String email,
    required String password,
  });
  ResultFuture authWithGoogle();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  late final FirebaseAuth _auth;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthRemoteDataSourceImpl(this._auth);
  @override
  ResultFuture login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      return const Right(null);
    } catch (e) {
      return Left(
        ApiFailure(message: e.toString(), statusCode: 500),
      );
    }
  }

  @override
  ResultFuture register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential _user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _user.user?.updateDisplayName(name);
      await _firestore.collection('users').add({
        'uid': _auth.currentUser!.uid,
        'name': name,
        'email': email,
        "password": password,
      });

      ZegoUIKitPrebuiltCallInvitationService().init(
        appID: CallItems.appId /*input your AppID*/,
        appSign: CallItems.appSignIn /*input your AppSign*/,
        userID: _auth.currentUser!.uid,
        userName: _auth.currentUser!.displayName!,
        plugins: [
          ZegoUIKitSignalingPlugin(),
        ],
      );

      return const Right(null);
    } catch (e) {
      return Left(
        ApiFailure(message: e.toString(), statusCode: 500),
      );
    }
  }

  @override
  ResultFuture authWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await _auth.signInWithCredential(credential);

      await _firestore.collection('users').add({
        'uid': _auth.currentUser!.uid,
        'name': _auth.currentUser!.displayName,
        'email': _auth.currentUser!.email,
        "password": _auth.currentUser!.email,
        "status": false,
      });

      return const Right(null);
    } catch (e) {
      return left(
        ApiFailure(message: '$e', statusCode: 505),
      );
    }
  }
}
