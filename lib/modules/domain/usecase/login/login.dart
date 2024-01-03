

import 'package:firebase_example/core/untils/imports.dart';


class LoginUsecase extends UseCaseWithParams<void, LoginParams> {
  final AuthRemoteDataSource _remoteDataSource;

  LoginUsecase(this._remoteDataSource);

  @override
  ResultFuture call(params) async {
    return await _remoteDataSource.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
