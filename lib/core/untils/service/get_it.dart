import 'package:firebase_example/core/untils/imports.dart';

final sl = GetIt.instance;

void setUp() {
  //App logic

  sl
    ..registerFactory(
      () {
        return AuthBloc(
          registerUsecase: sl(),
          loginUsecase: sl(),
        );
      },
    )
    ..registerFactory(
      () => MessagesBloc(),
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
