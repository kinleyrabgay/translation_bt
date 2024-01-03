import 'package:dartz/dartz.dart';
import 'package:translation_bt/core/errors/exceptions.dart';
import 'package:translation_bt/core/errors/failures.dart';
import 'package:translation_bt/core/utils/typedefs.dart';
import 'package:translation_bt/src/splasher/data/datasource/splasher_local_ds.dart';
import 'package:translation_bt/src/splasher/domain/repo/splasher_repo.dart';

class SplasherRepositoryImplementation implements SplasherRepository {
  const SplasherRepositoryImplementation(this._localDataSource);

  final SplasherLocalDataSource _localDataSource;

  @override
  ResultFuture<void> cacheFirstTimer() async {
    try {
      await _localDataSource.cacheFirstTimer();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<bool> checkFirstTimer() async {
    try {
      final result = await _localDataSource.checkFirstTimer();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
