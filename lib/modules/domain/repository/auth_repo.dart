import 'package:firebase_example/core/untils/typedef.dart';

abstract class AuthRepo {
  ResultFuture register({
    required String name,
    required String email,
    required String password,
  });
  ResultFuture login({
    required String email,
    required String password,
  });
}
