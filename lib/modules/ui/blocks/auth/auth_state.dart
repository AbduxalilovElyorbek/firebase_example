part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AuthErrorState extends AuthState {
  final Failure failure;

  const AuthErrorState(this.failure);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class RegisterSuccess extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends AuthState {
  @override
  List<Object?> get props => [];
}
