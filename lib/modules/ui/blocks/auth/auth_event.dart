part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class RegisterEvent extends AuthEvent {
  final RegisterParams params;

  const RegisterEvent(this.params);

  @override
  List<Object?> get props => [
        params,
      ];
}

class LoginEvent extends AuthEvent {
  final LoginParams params;

  const LoginEvent(this.params);

  @override
  List<Object?> get props => [
        params,
      ];
}

class AuthWithGoogle extends AuthEvent {
  const AuthWithGoogle();

  @override
  List<Object?> get props => [];
}
