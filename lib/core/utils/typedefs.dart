import 'package:dartz/dartz.dart';
import 'package:translation_bt/core/errors/failures.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef DataMap = Map<String, dynamic>;
