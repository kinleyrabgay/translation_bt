import 'package:translation_bt/core/usecases/usecase.dart';
import 'package:translation_bt/core/utils/typedefs.dart';
import 'package:translation_bt/src/splasher/domain/repo/splasher_repo.dart';

class CacheFirstTimer extends UsecaseWithoutParams<void> {
  const CacheFirstTimer(this._repo);

  final SplasherRepository _repo;

  @override
  ResultFuture<void> call() async => _repo.cacheFirstTimer();
}
