import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_example/core/exception/failure.dart';
import 'package:firebase_example/core/untils/call_items.dart';
import 'package:firebase_example/core/untils/imports.dart';
import 'package:firebase_example/modules/domain/usecase/register/register.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUsecase _registerUsecase;
  final LoginUsecase _loginUsecase;

  AuthBloc({
    required RegisterUsecase registerUsecase,
    required LoginUsecase loginUsecase,
  })  : _registerUsecase = registerUsecase,
        _loginUsecase = loginUsecase,
        super(AuthInitial()) {
    on<RegisterEvent>(_registerHandler);
    on<LoginEvent>(_loginHandler);

    on<ContactEvent>((event, emit) async {
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

    on<AuthWithGoogle>((event, emit) async {});
  }

  FutureOr<void> _registerHandler(
    RegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    try {
      var result = await _registerUsecase(event.params);

      result.fold((failure) => emit(AuthErrorState(failure)),
          (r) => emit(RegisterSuccess()));
    } catch (e) {
      emit(
        AuthErrorState(
          ApiFailure(
            message: e.toString(),
            statusCode: 500,
          ),
        ),
      );
    }
  }

  FutureOr<void> _loginHandler(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());

    try {
      var res = await _loginUsecase(event.params);

      res.fold(
        (failure) => emit(AuthErrorState(failure)),
        (r) => emit(
          LoginSuccess(),
        ),
      );
    } catch (e) {
      emit(
        AuthErrorState(
          ApiFailure(
            statusCode: 505,
            message: e.toString(),
          ),
        ),
      );
    }
  }
}
