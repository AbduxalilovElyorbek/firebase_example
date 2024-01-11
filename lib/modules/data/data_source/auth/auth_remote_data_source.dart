import 'package:dartz/dartz.dart';
import 'package:firebase_example/core/untils/imports.dart';

abstract class AuthRemoteDataSource {
  ResultFuture register({
    required String name,
    required String email,
    required String password,
    String? bio,
    String? profileImage,
    String? phoneNumber,
  });
  ResultFuture login({
    required String email,
    required String password,
  });
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

    String? bio,
    String? profileImage,
    String? phoneNumber,
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
        "bio": bio,
      });

      ZegoUIKitPrebuiltCallInvitationService().init(
        appID: ProjectItems.appId /*input your AppID*/,
        appSign: ProjectItems.appSignIn /*input your AppSign*/,
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
}
