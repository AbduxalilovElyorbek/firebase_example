import 'dart:async';

import 'package:firebase_example/core/untils/imports.dart';

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
    on<RegisterEvent>(
      _registerHandler,
    );
    on<LoginEvent>(
      _loginHandler,
    );

    on<AuthWithGoogle>((event, emit) {
      signInWithGoogle;
    });
  }
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
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
