import 'package:dartz/dartz.dart';
import 'package:firebase_example/core/exception/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef DataMap = Map<String, dynamic>;
