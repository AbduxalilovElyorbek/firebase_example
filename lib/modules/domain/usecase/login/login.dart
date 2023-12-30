import 'package:equatable/equatable.dart';
import 'package:firebase_example/core/untils/typedef.dart';
import 'package:firebase_example/core/untils/usecase/usecase.dart';
import 'package:firebase_example/modules/data/data_source/auth/auth_remote_data_source.dart';

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
