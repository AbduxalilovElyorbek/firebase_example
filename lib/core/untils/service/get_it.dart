import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_example/modules/data/data_source/auth/auth_remote_data_source.dart';
import 'package:firebase_example/modules/domain/usecase/login/login.dart';
import 'package:firebase_example/modules/domain/usecase/register/register.dart';
import 'package:firebase_example/modules/ui/blocks/auth/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setUp() {
  //App logic

  sl
    ..registerFactory(
      () => AuthBloc(
        registerUsecase: sl(),
        loginUsecase: sl(),
      ),
    )

    //data source
    ..registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(sl()))
    ..registerLazySingleton(() => RegisterUsecase(sl()))
    ..registerLazySingleton(() => LoginUsecase(sl()))
    ..registerLazySingleton(() => Dio())
    ..registerLazySingleton(
      () => FirebaseAuth.instance,
    );
}
