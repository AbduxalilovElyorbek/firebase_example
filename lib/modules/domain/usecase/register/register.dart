import 'package:equatable/equatable.dart';
import 'package:firebase_example/core/untils/typedef.dart';
import 'package:firebase_example/core/untils/usecase/usecase.dart';
import 'package:firebase_example/modules/data/data_source/auth/auth_remote_data_source.dart';

class RegisterUsecase extends UseCaseWithParams<void, RegisterParams> {
  final AuthRemoteDataSource _remoteDataSource;

  RegisterUsecase(this._remoteDataSource);

  @override
  ResultFuture<void> call(params) async {
    return await _remoteDataSource.register(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class RegisterParams extends Equatable {
  final String name;
  final String email;
  final String password;

  const RegisterParams({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        password,
      ];
}
